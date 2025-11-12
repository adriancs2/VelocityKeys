<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - Velocity Keys</title>
    <meta name="description" content="About Velocity Keys - Master code typing speed and accuracy. Open source typing practice application.">

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

    <link href="velocitykeys.css" type="text/css" rel="stylesheet" />
    <style>
        .about-content {
            padding: 30px;
            line-height: 1.2;
            color: #2c3e50;
            overflow-y: auto;
        }

            .about-content h2 {
                color: #3498db;
                margin-top: 30px;
                margin-bottom: 15px;
                font-size: 24px;
            }

            .about-content h3 {
                color: #2c3e50;
                margin-top: 20px;
                margin-bottom: 10px;
                font-size: 18px;
            }

            .about-content p {
                margin-bottom: 8px;
            }

            .about-content a {
                color: #3498db;
                text-decoration: none;
                font-weight: 500;
            }

                .about-content a:hover {
                    text-decoration: underline;
                }

            .about-content ul, .about-content ol {
                margin-left: 30px;
                margin-bottom: 15px;
            }

            .about-content li {
                margin-bottom: 8px;
            }

            .about-content code {
                background: #f4f4f4;
                padding: 2px 6px;
                border-radius: 3px;
                font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
                color: #e74c3c;
            }

            .about-content pre {
                background: #2c3e50;
                color: #ecf0f1;
                padding: 15px;
                border-radius: 5px;
                overflow-x: auto;
                margin-bottom: 15px;
            }

            .about-content .highlight {
                background: #fff9e6;
                padding: 15px;
                border-left: 4px solid #f39c12;
                margin-bottom: 8px;
                border-radius: 3px;
            }

        .project-link {
            display: block;
            padding: 15px;
            margin-bottom: 15px;
            background: white;
            border-radius: 8px;
            color: #2c3e50;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

            .project-link:hover {
                transform: translateY(-3px);
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            }

            .project-link strong {
                display: block;
                color: #3498db;
                font-size: 16px;
                margin-bottom: 5px;
            }

            .project-link span {
                font-size: 13px;
                color: #7f8c8d;
            }

        .right-panel-content {
            padding: 0;
        }
    </style>
    <style>
        .favicon-design {
            width: 128px;
            height: 128px;
            position: relative;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        }

        .favicon-design-cursor-container {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .favicon-design-v-letter {
            font-size: 64px;
            font-weight: bold;
            color: white;
            font-family: 'Consolas', monospace;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .favicon-design-typing-cursor {
            width: 4px;
            height: 60px;
            background: white;
            animation: favicon-design-blink 1s infinite;
        }

        @keyframes favicon-design-blink {
            0%, 49% {
                opacity: 1;
            }

            50%, 100% {
                opacity: 0;
            }
        }
    </style>
</head>
<body>

    <!-- Program Header -->
    <div class="program-header">
        <h1 class="program-title">Velocity Keys</h1>
        <p class="program-subtitle">Master Code Typing. Test Your Speed & Accuracy.</p>
    </div>

    <div class="container">

        <!-- Left Panel - Navigation -->
        <div class="left-panel">
            <div class="control-group">
                <button class="btn" onclick="window.location.href='/'">Home</button>
            </div>
        </div>

        <!-- Center Panel - About Content -->
        <div class="center-panel">

            <div class="about-content">
                <div class="favicon-design">
                    <div class="favicon-design-cursor-container">
                        <div class="favicon-design-v-letter">V</div>
                        <div class="favicon-design-typing-cursor"></div>
                    </div>
                </div>

                <h2>About Velocity Keys</h2>

                <p><strong>Velocity Keys</strong> - Master speed and accuracy. Practice with real code snippets, track WPM, and improve precision in 1 to 10 minutes challenges.</p>

                <div class="highlight">
                    <p><strong>Open Source Project</strong></p>
                    <p>Source Code: <a href="https://github.com/adriancs2/VelocityKeys" target="_blank">https://github.com/adriancs2/VelocityKeys</a></p>
                    <p><strong>Free to use, modify, and distribute</strong></p>
                    <p><strong>Can be used in competitions and commercial projects</strong></p>
                </div>

                <h2>Development</h2>
                <ul>
                    <li><strong>Project Lead & Developer:</strong> adriancs</li>
                    <li><strong>AI Development Partner:</strong> Claude (Anthropic), Opus 4.1, Sonnet 4.5 </li>
                    <li><strong>License:</strong> The Unlicense (Public Domain)</li>
                </ul>

                <h2>Features</h2>
                <ul>
                    <li>Real-time WPM (Words Per Minute) tracking</li>
                    <li>Accuracy percentage calculation</li>
                    <li>Multiple timer options (1, 5, and 10 minutes)</li>
                    <li>Custom text upload support</li>
                    <li>Default code samples included</li>
                    <li>Test history tracking (last 10 results)</li>
                    <li>Visual character-by-character feedback</li>
                    <li>Responsive design</li>
                    <li>Clean, modern interface</li>
                </ul>

                <h2>How to Prepare Default Sample Texts</h2>
                <p>Follow these steps to add your own default sample texts to the application:</p>

                <h3>Step 1: Create the Sample Text Folder</h3>
                <p>Create a folder named <code>/sample_text</code> in your web application's root directory.</p>

                <h3>Step 2: Add Your Text Files</h3>
                <p>Upload your sample text files to this folder. You can use any plain text format (.txt, .js, .py, .java, .cpp, .html, .css, etc.)</p>
                <p><strong>Examples:</strong></p>
                <ul>
                    <li><code>/sample_text/text1.txt</code></li>
                    <li><code>/sample_text/sample.txt</code></li>
                    <li><code>/sample_text/code.txt</code></li>
                    <li><code>/sample_text/javascript-example.js</code></li>
                    <li><code>/sample_text/python-functions.py</code></li>
                </ul>

                <h3>Step 3: Create the Filenames List</h3>
                <p>Create a file named <code>filenames.txt</code> in the <code>/sample_text</code> folder and list all your text files separated by commas:</p>
                <pre>text1.txt,sample.txt,code.txt,javascript-example.js,python-functions.py</pre>

                <p><strong>Important:</strong> The filenames should match exactly as they appear in the folder.</p>

                <h3>Step 4: Test Your Setup</h3>
                <p>Reload the application. The default text buttons should now appear in the left panel, allowing users to select from your custom sample texts.</p>

                <h2>Technology Stack</h2>
                <ul>
                    <li>HTML</li>
                    <li>Vanilla JavaScript (No frameworks required)</li>
                    <li>CSS3 with modern animations</li>
                    <li>LocalStorage for history and custom texts</li>
                </ul>

                <h2>Fork the Repository</h2>
                <p>You are welcome to fork the repository to make your own customize solution.</p>

            </div>
        </div>

        <!-- Right Panel - Project Links -->
        <div class="right-panel">
            <div class="history-title">Project Links</div>
            <div class="right-panel-content">
                <a href="https://github.com/adriancs2/VelocityKeys" target="_blank" class="project-link">
                    <strong>GitHub Repository</strong>
                    <span>Source Code & Documentation</span>
                </a>

                <a href="https://github.com/adriancs2/VelocityKeys/issues" target="_blank" class="project-link">
                    <strong>Report Issues</strong>
                    <span>Bug Reports & Feature Requests</span>
                </a>

                <a href="https://github.com/adriancs2/VelocityKeys/fork" target="_blank" class="project-link">
                    <strong>Fork Project</strong>
                    <span>Create Your Own Version</span>
                </a>

                <a href="https://github.com/adriancs2/VelocityKeys/blob/main/LICENSE" target="_blank" class="project-link">
                    <strong>License Info</strong>
                    <span>The Unlicense (Public Domain)</span>
                </a>
            </div>
        </div>
    </div>

</body>
</html>
