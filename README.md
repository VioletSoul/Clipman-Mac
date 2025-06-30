# Clipman-Mac

![macOS](https://img.shields.io/badge/macOS-000000?style=flat&logo=apple&logoColor=white)
![Terminal](https://img.shields.io/badge/Terminal-✓-black)
![Clipboard](https://img.shields.io/badge/Clipboard-✓-purple)
![fzf](https://img.shields.io/badge/fzf-✓-green)
![Homebrew](https://img.shields.io/badge/Homebrew-✓-orange)
![Repo Size](https://img.shields.io/github/repo-size/VioletSoul/Clipman-Mac)
![Code Size](https://img.shields.io/github/languages/code-size/VioletSoul/Clipman-Mac)
[![Stars](https://img.shields.io/github/stars/VioletSoul/Clipman-Mac.svg?style=social)](https://github.com/VioletSoul/Clipman-Mac)
[![Last Commit](https://img.shields.io/github/last-commit/VioletSoul/Clipman-Mac.svg)](https://github.com/VioletSoul/Clipman-Mac/commits/main)

## 📚 Description

**User-friendly, terminal-based clipboard manager for macOS.**

## Why Use Clipman-Mac?

macOS lacks a built-in, terminal-friendly clipboard manager.

Clipman-Mac solves this problem: it is a lightweight, fast, and simple solution that integrates seamlessly into your terminal workflow.

## Features

- **Terminal-based:** Fully controlled from the command line.
- **Clipboard history:** Keeps track of your most recent copy operations.
- **Fast search:** Select entries using the fuzzy finder `fzf`.
- **Minimalist:** Uses only standard macOS utilities (`pbcopy`/`pbpaste`).
- **Easy setup:** Ready to use after a few commands.

## Installation

1. **Install Homebrew (if not already installed):**
    ```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

2. **Install dependencies:**
    ```
    brew install fzf
    ```

3. **Clone the repository:**
    ```
    git clone https://github.com/VioletSoul/Clipman-Mac.git
    cd Clipman-Mac
    ```

4. **Make the script executable (if needed):**
    ```
    chmod +x clipman.sh
    ```

5. **Run the script:**
    ```
    ./clipman.sh
    ```

## Usage

- **Run the script in your terminal.**
- **Search your clipboard history using `fzf`.**
- **The selected item will be automatically copied back to your clipboard or printed to the terminal.**

## Dependencies

- **macOS**
- **Homebrew** (for easy installation)
- **fzf** (fuzzy finder)
- **pbcopy, pbpaste** (standard macOS utilities)

## License

MIT License

## Contact

Questions and suggestions:
- **GitHub Issues:** [Open an issue](https://github.com/VioletSoul/Clipman-Mac/issues)
- **Or contact the author directly.**

---

Keep your clipboard at your fingertips, right in the terminal!
