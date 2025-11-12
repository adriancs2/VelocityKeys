// Default fallback text if file not found
const fallbackText = `<!DOCTYPE html>
<html>
<head>
<title>Hello World</title>
</head>
<body>
<h1>Hello World</h1>
<p>This is a simple HTML page.</p>
</body>
</html>`;

// Global variables
let codeLines = [];
let currentLineIndex = 0;
let currentCharIndex = 0;
let startTime = null;
let timerInterval = null;
let selectedTime = 60; // seconds
let isTestActive = false;
let isTestStarted = false; // Track if test has started
let hasStartedTyping = false; // Track if user has started typing
let totalCharsTyped = 0;
let correctChars = 0;
let incorrectChars = 0;
let countedChars = new Set(); // Track which characters have been counted already
let history = [];
let customTexts = []; // Store custom text files
let defaultTexts = []; // Store default text files

// Get query parameter
function getQueryParameter(name) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
}

// Initialize
document.addEventListener('DOMContentLoaded', () => {
    const sourceFileUrl = getQueryParameter('sourcefile');

    if (sourceFileUrl) {
        // If sourcefile parameter exists, try to load it
        loadSourceFile(sourceFileUrl);
    } else {
        // Normal initialization
        loadDefaultTexts();
        loadCustomTexts();
    }

    loadHistory();
    setupEventListeners();
});

function setupEventListeners() {
    // Start button
    document.getElementById('startBtn').addEventListener('click', startTest);

    // Restart button
    document.getElementById('restartBtn').addEventListener('click', restartTest);

    // Clear history button
    document.getElementById('clearHistoryBtn').addEventListener('click', clearHistory);

    // Time selector buttons
    document.querySelectorAll('.time-btn').forEach(btn => {
        btn.addEventListener('click', function () {
            document.querySelectorAll('.time-btn').forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            selectedTime = parseInt(this.dataset.time);
            updateTimerDisplay();
        });
    });

    // File input
    document.getElementById('fileInput').addEventListener('change', handleFileUpload);

    // Typing input
    const typingInput = document.getElementById('typingInput');
    typingInput.addEventListener('input', handleTyping);
    typingInput.addEventListener('keydown', handleKeyDown);
}

async function loadDefaultTexts() {
    try {
        // First, load the filenames.txt file
        const response = await fetch('/sample_text/filenames.txt');
        if (response.ok) {
            const filenamesText = await response.text();
            if (filenamesText.trim()) {
                // Split by comma and trim whitespace
                const filenames = filenamesText.split(',').map(name => name.trim()).filter(name => name);

                // Load each file
                for (let i = 0; i < filenames.length; i++) {
                    const filename = filenames[i];
                    try {
                        const fileResponse = await fetch(`/sample_text/${filename}`);
                        if (fileResponse.ok) {
                            const content = await fileResponse.text();
                            defaultTexts.push({
                                name: filename,
                                content: content,
                                index: i + 1
                            });
                        }
                    } catch (error) {
                        console.log(`Could not load ${filename}:`, error);
                    }
                }

                // Display default text buttons
                displayDefaultTexts();

                // Load the first default text if available
                if (defaultTexts.length > 0) {
                    loadText(defaultTexts[0].content);
                } else {
                    // Use fallback if no default texts loaded
                    loadText(fallbackText);
                }
            } else {
                // Use fallback if filenames.txt is empty
                loadText(fallbackText);
            }
        } else {
            // Use fallback if filenames.txt not found
            console.log('filenames.txt not found, using fallback');
            loadText(fallbackText);
        }
    } catch (error) {
        // Use fallback on any error
        console.log('Using fallback text due to error:', error);
        loadText(fallbackText);
    }
}

async function loadSourceFile(url) {
    try {
        // Show loading message
        document.getElementById('codeDisplay').innerHTML = '<div class="code-line">Loading source file...</div>';

        const response = await fetch(url);
        if (response.ok) {
            const content = await response.text();

            // Validate that content is not empty
            if (content.trim()) {
                // Successfully loaded source file
                loadText(content);

                // Hide default texts and custom text upload controls
                hideTextControls();

                console.log('Source file loaded successfully from:', url);
            } else {
                throw new Error('Source file is empty');
            }
        } else {
            throw new Error(`Failed to fetch source file: ${response.status}`);
        }
    } catch (error) {
        console.error('Error loading source file:', error);
        alert(`Failed to load source file from: ${url}\n\nError: ${error.message}\n\nLoading default texts instead.`);

        // Fall back to normal initialization
        loadDefaultTexts();
        loadCustomTexts();
    }
}

function hideTextControls() {
    // Hide default texts container
    const defaultTextsContainer = document.getElementById('defaultTextsContainer');
    if (defaultTextsContainer) {
        defaultTextsContainer.style.display = 'none';
    }

    // Hide custom texts container
    const customTextsContainer = document.getElementById('customTextsContainer');
    if (customTextsContainer) {
        customTextsContainer.style.display = 'none';
    }

    // Hide file input wrapper
    const fileInputWrapper = document.querySelector('.file-input-wrapper');
    if (fileInputWrapper) {
        fileInputWrapper.style.display = 'none';
    }

    // Hide the "Text Options" heading
    const textOptionsHeading = document.querySelector('.left-panel .control-group:nth-child(3) h3');
    if (textOptionsHeading && textOptionsHeading.textContent === 'Text Options') {
        textOptionsHeading.style.display = 'none';
    }
}

function displayDefaultTexts() {
    const container = document.getElementById('defaultTextsContainer');
    container.innerHTML = '';

    defaultTexts.forEach((defaultText) => {
        const button = document.createElement('button');
        button.className = 'default-text-btn';
        button.textContent = `Use Default Text ${defaultText.index}`;
        button.title = defaultText.name; // Show filename on hover

        button.onclick = () => {
            loadText(defaultText.content);
        };

        container.appendChild(button);
    });
}

function processCodeLine(line) {
    // Remove leading/trailing whitespace and tabs
    let processed = line.trim();

    // Replace tabs with single space
    processed = processed.replace(/\t/g, ' ');

    // Replace multiple spaces with single space
    processed = processed.replace(/\s+/g, ' ');

    return processed;
}

function splitLongLines(lines, maxLength = 80) {
    const result = [];

    lines.forEach(line => {
        if (line.length <= maxLength) {
            result.push(line);
        } else {
            // Split long lines at logical break points
            let remaining = line;
            while (remaining.length > 0) {
                if (remaining.length <= maxLength) {
                    result.push(remaining);
                    break;
                }

                // Try to find a good break point (space, comma, operator)
                let breakPoint = maxLength;
                for (let i = maxLength; i > maxLength * 0.5; i--) {
                    if (' ,;()[]{}+-*/=<>!&|'.includes(remaining[i])) {
                        breakPoint = i + 1;
                        break;
                    }
                }

                result.push(remaining.substring(0, breakPoint).trim());
                remaining = remaining.substring(breakPoint).trim();
            }
        }
    });

    return result;
}

function loadText(text) {
    // Split into lines and process each line
    let processedLines = text.split('\n').map(line => processCodeLine(line));

    // Remove empty lines if they exist
    processedLines = processedLines.filter(line => line.length > 0);

    // Split long lines
    codeLines = splitLongLines(processedLines);

    currentLineIndex = 0;
    currentCharIndex = 0;
    displayCode();
    document.getElementById('typingInput').value = '';
}

function displayCode() {
    const codeDisplay = document.getElementById('codeDisplay');
    codeDisplay.innerHTML = '';

    // Show 4 lines at a time
    const linesToShow = 4;
    const endIndex = Math.min(currentLineIndex + linesToShow, codeLines.length);

    for (let i = currentLineIndex; i < endIndex; i++) {
        const lineDiv = document.createElement('div');
        lineDiv.className = 'code-line';
        if (i === currentLineIndex) {
            lineDiv.classList.add('active');
        }

        // Create spans for each character for tracking
        const lineText = codeLines[i];
        for (let j = 0; j < lineText.length; j++) {
            const charSpan = document.createElement('span');
            charSpan.className = 'char';
            charSpan.textContent = lineText[j];
            charSpan.dataset.index = j;
            lineDiv.appendChild(charSpan);
        }

        codeDisplay.appendChild(lineDiv);
    }

    // Add empty lines if needed
    if (endIndex - currentLineIndex < linesToShow) {
        for (let i = 0; i < linesToShow - (endIndex - currentLineIndex); i++) {
            const emptyLine = document.createElement('div');
            emptyLine.className = 'code-line';
            emptyLine.innerHTML = '&nbsp;';
            codeDisplay.appendChild(emptyLine);
        }
    }
}

function handleFileUpload(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            const content = e.target.result;

            // Add to custom texts
            const customText = {
                name: file.name,
                content: content,
                id: Date.now() // Use timestamp as unique ID
            };

            // Check if we already have 10 custom texts
            if (customTexts.length >= 10) {
                if (confirm('You have reached the maximum of 10 custom texts. Would you like to replace the oldest one?')) {
                    customTexts.shift(); // Remove the oldest
                } else {
                    return;
                }
            }

            customTexts.push(customText);
            saveCustomTexts();
            displayCustomTexts();
            loadText(content);
        };
        reader.readAsText(file);

        // Reset file input so the same file can be selected again
        event.target.value = '';
    }
}

function startTest() {
    if (isTestStarted) return;

    isTestStarted = true;
    isTestActive = true;
    hasStartedTyping = false;
    totalCharsTyped = 0;
    correctChars = 0;
    incorrectChars = 0;
    countedChars.clear(); // Reset counted characters tracking
    currentLineIndex = 0;
    currentCharIndex = 0;

    document.getElementById('typingInput').disabled = false;
    document.getElementById('typingInput').value = '';
    document.getElementById('typingInput').focus();
    document.getElementById('typingInput').placeholder = 'Start typing to begin the timer...';

    displayCode();
    // Don't start timer here - wait for first keystroke
}

function restartTest() {
    stopTest();
    if (defaultTexts.length > 0) {
        loadText(defaultTexts[0].content);
    } else {
        loadText(fallbackText);
    }
    document.getElementById('currentWpm').textContent = '0';
    document.getElementById('accuracy').textContent = '100';
    document.getElementById('typingInput').placeholder = 'Click here and start typing...';
    updateTimerDisplay();
}

function stopTest() {
    isTestActive = false;
    isTestStarted = false;
    hasStartedTyping = false;
    if (timerInterval) {
        clearInterval(timerInterval);
        timerInterval = null;
    }
    document.getElementById('typingInput').disabled = true;
}

function startTimer() {
    const endTime = Date.now() + (selectedTime * 1000);

    timerInterval = setInterval(() => {
        const remainingTime = Math.max(0, endTime - Date.now());
        const minutes = Math.floor(remainingTime / 60000);
        const seconds = Math.floor((remainingTime % 60000) / 1000);

        document.getElementById('timerDisplay').textContent =
            `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;

        if (remainingTime === 0) {
            endTest();
        }

        updateSpeedometer();
    }, 100);
}

function updateTimerDisplay() {
    const minutes = Math.floor(selectedTime / 60);
    const seconds = selectedTime % 60;
    document.getElementById('timerDisplay').textContent =
        `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
}

function handleKeyDown(event) {
    if (event.key === 'Enter') {
        event.preventDefault();  // Prevent default behavior only
        // Enter key functionality disabled
    }
}

function handleTyping(event) {
    if (!isTestActive) return;

    // Start timer on first keystroke
    if (!hasStartedTyping) {
        hasStartedTyping = true;
        startTime = Date.now();
        startTimer();
        document.getElementById('typingInput').placeholder = '';
    }

    const input = event.target.value;
    const currentLine = codeLines[currentLineIndex] || '';

    // Update character highlights
    const activeLineElement = document.querySelector('.code-line.active');
    if (activeLineElement) {
        const chars = activeLineElement.querySelectorAll('.char');

        // Reset all chars
        chars.forEach(char => {
            char.classList.remove('correct', 'incorrect');
        });

        // Check each typed character
        let hasError = false;
        for (let i = 0; i < input.length; i++) {
            if (i < chars.length) {
                const charKey = `${currentLineIndex}-${i}`;

                if (input[i] === currentLine[i]) {
                    chars[i].classList.add('correct');
                    if (!countedChars.has(charKey)) {
                        correctChars++;
                        totalCharsTyped++;
                        countedChars.add(charKey);
                    }
                } else {
                    chars[i].classList.add('incorrect');
                    hasError = true;
                    if (!countedChars.has(charKey)) {
                        incorrectChars++;
                        totalCharsTyped++;
                        countedChars.add(charKey);
                    }
                }
            }
        }

        // Update input style based on errors
        event.target.classList.toggle('error', hasError);
    }

    currentCharIndex = input.length;

    // Check if line is complete
    if (input === currentLine) {
        setTimeout(() => {
            currentLineIndex++;
            if (currentLineIndex >= codeLines.length) {
                currentLineIndex = 0; // Loop back to start
            }
            currentCharIndex = 0;
            document.getElementById('typingInput').value = '';
            displayCode();
        }, 100);
    }
}

function updateSpeedometer() {
    if (!isTestActive || !startTime) return;

    const timeElapsed = (Date.now() - startTime) / 1000 / 60; // in minutes
    if (timeElapsed > 0) {
        const wpm = Math.round((totalCharsTyped / 5) / timeElapsed);
        document.getElementById('currentWpm').textContent = wpm;

        const accuracy = totalCharsTyped > 0
            ? Math.round((correctChars / totalCharsTyped) * 100)
            : 100;
        document.getElementById('accuracy').textContent = accuracy;
    }
}

function endTest() {
    stopTest();

    const timeElapsed = selectedTime / 60; // in minutes
    const wpm = Math.round((totalCharsTyped / 5) / timeElapsed);
    const accuracy = totalCharsTyped > 0
        ? Math.round((correctChars / totalCharsTyped) * 100)
        : 0;

    // Add to history
    const result = {
        wpm: wpm,
        accuracy: accuracy,
        totalChars: totalCharsTyped,
        time: new Date().toLocaleString(),
        duration: selectedTime
    };

    history.unshift(result);
    if (history.length > 10) {
        history = history.slice(0, 10);
    }

    saveHistory();
    displayHistory();
    showResults(result);
}

function showResults(result) {
    document.getElementById('finalWpm').textContent = result.wpm;
    document.getElementById('finalAccuracy').textContent = result.accuracy + '%';
    document.getElementById('totalChars').textContent = result.totalChars;
    document.getElementById('resultsModal').classList.add('active');
}

function saveCustomTexts() {
    localStorage.setItem('customTexts', JSON.stringify(customTexts));
}

function loadCustomTexts() {
    const saved = localStorage.getItem('customTexts');
    if (saved) {
        customTexts = JSON.parse(saved);
        displayCustomTexts();
    }
}

function displayCustomTexts() {
    const container = document.getElementById('customTextsContainer');
    container.innerHTML = '';

    customTexts.forEach((customText, index) => {
        const button = document.createElement('button');
        button.className = 'custom-text-btn';

        const nameSpan = document.createElement('span');
        nameSpan.className = 'custom-text-name';
        nameSpan.textContent = `Custom Text ${index + 1}`;
        nameSpan.title = customText.name; // Show full name on hover

        const deleteBtn = document.createElement('button');
        deleteBtn.className = 'delete-custom-btn';
        deleteBtn.textContent = 'del';
        deleteBtn.onclick = (e) => {
            e.stopPropagation();
            deleteCustomText(customText.id);
        };

        button.appendChild(nameSpan);
        button.appendChild(deleteBtn);

        button.onclick = () => {
            loadText(customText.content);
        };

        container.appendChild(button);
    });
}

function deleteCustomText(id) {
    if (confirm('Are you sure you want to delete this custom text?')) {
        customTexts = customTexts.filter(text => text.id !== id);
        saveCustomTexts();
        displayCustomTexts();
    }
}

function clearHistory() {
    if (confirm('Are you sure you want to clear all history?')) {
        history = [];
        localStorage.removeItem('typingTestHistory');
        displayHistory();
    }
}

function closeResults() {
    document.getElementById('resultsModal').classList.remove('active');
}

function saveHistory() {
    localStorage.setItem('typingTestHistory', JSON.stringify(history));
}

function loadHistory() {
    const saved = localStorage.getItem('typingTestHistory');
    if (saved) {
        history = JSON.parse(saved);
        displayHistory();
    }
}

function displayHistory() {
    const container = document.getElementById('historyContainer');
    container.innerHTML = '';

    history.forEach((item, index) => {
        const historyDiv = document.createElement('div');
        historyDiv.className = 'history-item';
        historyDiv.innerHTML = `
                    <div class="history-wpm">${item.wpm} WPM</div>
                    <div class="history-accuracy">Accuracy: ${item.accuracy}%</div>
                    <div class="history-time">${item.time}</div>
                    <div class="history-time">Duration: ${item.duration}s</div>
                `;
        container.appendChild(historyDiv);
    });
}

// Make closeResults available globally
window.closeResults = closeResults;