<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Velocity Keys</title>
    <meta name="description" content="Master code typing speed and accuracy. Practice with real code snippets, track WPM, and improve precision in 30s to 10min challenges. Code typing practice. Typing test.">

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://velocitykeys.com/">
    <meta property="og:title" content="Velocity Keys - Code Typing Practice">
    <meta property="og:description" content="Master code typing speed and accuracy. Practice with real code snippets, track WPM, and improve precision.">
    <meta property="og:image" content="https://velocitykeys.com/favicon/thumbnail.png">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://velocitykeys.com/">
    <meta property="twitter:title" content="Velocity Keys - Code Typing Practice">
    <meta property="twitter:description" content="Master code typing speed and accuracy. Practice with real code snippets, track WPM, and improve precision.">
    <meta property="twitter:image" content="https://velocitykeys.com/favicon/thumbnail.png">

    <!-- Favicon -->
    <link rel="shortcut icon" href="/favicon.ico">
    <link rel="apple-touch-icon" sizes="57x57" href="/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon/favicon-16x16.png">
    <link rel="manifest" href="/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#667eea">
    <meta name="theme-color" content="#667eea">
    <meta name="msapplication-TileImage" content="/favicon/ms-icon-144x144.png">

    <link href="velocitykeys2.css" type="text/css" rel="stylesheet" />
</head>
<body>

    <!-- Program Header -->
    <div class="program-header">
        <h1 class="program-title">Velocity Keys</h1>
        <p class="program-subtitle">Master Code Typing. Test Your Code Typing Speed & Accuracy.</p>
    </div>

    <div class="container">

        <!-- Left Panel - Controls -->
        <div class="left-panel">
            <button class="mobile-close-btn" id="closeLeftPanel">✕</button>
            <div class="control-group">
                <h3>Controls</h3>
                <button class="btn" id="startBtn">Start Test</button>
                <button class="btn restart" id="restartBtn">Restart</button>
            </div>

            <div class="control-group">
                <h3>Timer Length</h3>
                <div class="time-selector">
                    <button class="time-btn active" data-time="60">1 minute</button>
                    <button class="time-btn" data-time="300">5 minutes</button>
                    <button class="time-btn" data-time="600">10 minutes</button>
                </div>
            </div>

            <div class="control-group">
                <h3>Text Options</h3>
                <div class="default-texts-container" id="defaultTextsContainer">
                    <!-- Default text buttons will be added here dynamically -->
                </div>
                <div class="custom-texts-container" id="customTextsContainer">
                    <!-- Custom text buttons will be added here dynamically -->
                </div>
                <div class="file-input-wrapper">
                    <input type="file" id="fileInput" accept=".txt,.js,.py,.java,.cpp,.c,.html,.css">
                    <label for="fileInput" class="file-input-label">Load Custom Text</label>
                </div>
            </div>

            <div class="control-group">
                <h3>History</h3>
                <button class="btn restart" id="clearHistoryBtn">Clear History</button>
            </div>

            <div class="control-group">
                <button class="btn" onclick="window.location.href='/About.aspx'" style="background: #27ae60;">About</button>
            </div>
        </div>

        <!-- Center Panel - Main Typing Area -->
        <div class="center-panel">
            <!-- Mobile Toggle Buttons (only visible on mobile) -->
            <div class="mobile-toggles">
                <button class="mobile-toggle-btn" id="toggleLeftPanel">Settings</button>
                <button class="mobile-toggle-btn" id="toggleRightPanel">History</button>
            </div>

            <!-- Speedometer -->
            <div class="speedometer-container">
                <div class="speed-display">
                    <div class="speed-value" id="currentWpm">0</div>
                    <div class="speed-label">WPM</div>
                </div>
                <div class="timer-display" id="timerDisplay">01:00</div>
                <div class="speed-display">
                    <div class="speed-value" id="accuracy">100</div>
                    <div class="speed-label">Accuracy %</div>
                </div>
            </div>

            <!-- Code Display -->
            <div class="code-display" id="codeDisplay"></div>

            <!-- Input Area -->
            <div class="input-container">
                <textarea class="typing-input" id="typingInput" placeholder="Click [Start Test] to begin typing..." disabled></textarea>
            </div>
        </div>

        <!-- Right Panel - History -->
        <div class="right-panel">
            <button class="mobile-close-btn" id="closeRightPanel">✕</button>
            <div class="history-title">History</div>
            <div id="historyContainer"></div>
        </div>
    </div>

    <!-- Results Modal -->
    <div class="results-modal" id="resultsModal">
        <div class="results-content">
            <div class="results-title">Test Complete!</div>
            <div class="result-stat">
                <div class="result-label">Words Per Minute</div>
                <div class="result-value" id="finalWpm">0</div>
            </div>
            <div class="result-stat">
                <div class="result-label">Accuracy</div>
                <div class="result-value" id="finalAccuracy">0%</div>
            </div>
            <div class="result-stat">
                <div class="result-label">Total Characters</div>
                <div class="result-value" id="totalChars">0</div>
            </div>
            <button class="btn" onclick="closeResults()">Close</button>
        </div>
    </div>

    <script src="velocitykeys2.js"></script>
</body>
</html>
