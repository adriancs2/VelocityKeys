# Velocity Keys

![License](https://img.shields.io/badge/license-Unlicense-blue.svg)
![Live Demo](https://img.shields.io/badge/demo-live-green.svg)
![HTML](https://img.shields.io/badge/HTML-CSS-orange.svg)
![JavaScript](https://img.shields.io/badge/JavaScript-Vanilla-yellow.svg)

![Velocity Keys Screenshot](https://raw.githubusercontent.com/adriancs2/VelocityKeys/refs/heads/main/VelocityKeys/favicon/thumbnail.png)

## Introduction

**Velocity Keys** is a web-based code typing practice application designed to help developers improve their typing speed and accuracy with real code snippets. Track your WPM (Words Per Minute), monitor accuracy in real-time, and practice with custom or default code samples.

Perfect for developers who want to type faster and code more efficiently.

## Live Demo

**Try it now:** [https://velocitykeys.com](https://velocitykeys.com)

## Features

- **Real-time WPM tracking** - See your speed as you type
- **Accuracy percentage** - Monitor your typing precision
- **Multiple timer options** - 1, 5, or 10-minute tests
- **Custom text upload** - Practice with your own code samples
- **Default code samples** - Pre-loaded programming snippets
- **Test history** - Track your last 10 results
- **Character-by-character feedback** - Visual indication of correct/incorrect typing
- **Clean modern interface** - Beautiful purple gradient design
- **Local storage** - All data stored in your browser

## Technology Stack

- **HTML/CSS** - Clean, semantic markup and modern styling
- **Vanilla JavaScript** - No frameworks, pure JavaScript
- **LocalStorage API** - Client-side data persistence
- **ASP.NET Web Forms** - Optional (can be converted to plain HTML)

## WPM Calculation Formula

Velocity Keys uses the **industry-standard WPM calculation** formula:

```
WPM = (Total Characters Typed ÷ 5) ÷ Time in Minutes
```

### Why divide by 5?

The standard typing test convention defines a "word" as **5 characters** (including spaces), based on the average English word length. This formula is used by major typing test platforms like Monkeytype, TypingTest.com, and Typing.com.

### Accuracy Calculation

```
Accuracy = (Correct Characters ÷ Total Characters Typed) × 100%
```

Both formulas follow industry standards and provide accurate, comparable results.

## Data Storage

All user data is stored **locally in your browser** using the LocalStorage API:

- **Test history** (last 10 results)
- **Custom uploaded texts** (up to 10)
- **No server-side storage** - Your data never leaves your device
- **Privacy-focused** - No tracking, no analytics, no data collection

To clear your data, simply use the "Clear History" button or clear your browser's localStorage.

## Getting Started

### Quick Start

1. **Clone the repository:**
   ```bash
   git clone https://github.com/adriancs2/VelocityKeys.git
   cd VelocityKeys
   ```

2. **Run with a web server:**
   - Use any web server (IIS, Apache, Nginx, etc.)
   - Or use a simple local server:
     ```bash
     # Python 3
     python -m http.server 8000
     
     # Node.js (with http-server)
     npx http-server
     ```

3. **Open in browser:**
   ```
   http://localhost:8000/Default.aspx
   ```

### Converting ASPX to HTML/PHP

For non-ASP.NET environments, simply rename the files:

**Example for HTML:**
- Rename `Default.aspx` → `index.html`
- Rename `About.aspx` → `About.html`
- Update the About link in `index.html` (line 89):
  ```html
  <button class="btn" onclick="window.location.href='/About.html'">About</button>
  ```

**Example for PHP:**
- Rename `Default.aspx` → `index.php`
- Rename `About.aspx` → `About.php`
- Update the About link accordingly

The core functionality is pure HTML/CSS/JavaScript and works in any environment.

## Customization

### Adding Custom Sample Texts

1. **Create the sample text folder:**
   ```
   /sample_text/
   ```

2. **Add your text files:**
   Upload any plain text files to this folder:
   ```
   /sample_text/text1.txt
   /sample_text/javascript-code.js
   /sample_text/python-functions.py
   /sample_text/html-sample.html
   ```

3. **Create the filenames list:**
   Create a file named `filenames.txt` in the `/sample_text/` folder:
   ```
   text1.txt,javascript-code.js,python-functions.py,html-sample.html
   ```
   
   **Important:** 
   - Separate filenames with commas
   - No spaces around commas
   - Filenames must match exactly

4. **Test your setup:**
   Reload the application. Your custom text buttons should appear in the left panel under "Text Options."

### Changing Colors/Theme

Edit `velocitykeys.css` to customize the color scheme. Main colors:
- Primary gradient: `#667eea` to `#764ba2`
- Accent color: `#3498db`
- Success color: `#27ae60`
- Error color: `#e74c3c`

## File Structure

```
VelocityKeys/
├── Default.aspx           # Main typing test page
├── About.aspx            # About page with documentation
├── velocitykeys.css      # All styling
├── velocitykeys.js       # Application logic
├── /favicon/             # Favicon files (all sizes)
│   ├── favicon-32x32.png
│   ├── apple-icon-*.png
│   └── manifest.json
└── /sample_text/         # Default sample texts
    ├── filenames.txt     # List of sample files
    └── *.txt             # Your sample text files
```

## License

This project is released under **The Unlicense** (Public Domain).

You are free to:
- Use commercially
- Modify
- Distribute
- Use in competitions
- Use privately

**No attribution required.** Do whatever you want with it!

Full license text: [https://unlicense.org/](https://unlicense.org/)

## Credits

**Project Lead & Developer:** [adriancs2 (adriancs)](https://github.com/adriancs2)

**AI Development Partner:** Claude (Anthropic) - Claude Opus 4.1 & Sonnet 4.5

## Fork & Customize

You are welcome to fork this project and customize with your own needs.

## Acknowledgments

Inspired by typing test platforms like Monkeytype, TypingTest.com, and TypeRacer. Built for developers who want to type faster and code more efficiently.

---

**Happy Typing!**
