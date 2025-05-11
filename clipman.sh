#!/bin/zsh

# ---------------------------------------------
# Advanced Clipboard Manager for macOS Terminal
# ---------------------------------------------

# Configuration
HISTORY_FILE="${HOME}/.clipboard_history"  # File to store clipboard history
MAX_ENTRIES=50                            # Maximum number of entries to keep in history

# Terminal color codes for better UI
FG_BLUE=$(tput setaf 4)
FG_RED=$(tput setaf 1)
FG_GREEN=$(tput setaf 2)
BOLD=$(tput bold)
RESET=$(tput sgr0)

# ---------------------------------------------
# Function: require
# Checks if a command exists; if not, prints an error and exits
# Arguments:
#   $1 - command name to check
# ---------------------------------------------
require() {
    command -v "$1" >/dev/null 2>&1 || {
        echo "${FG_RED}Error:${RESET} Required command ${BOLD}$1${RESET} is not installed."
        [[ "$1" == "fzf" ]] && echo "You can install it with: ${BOLD}brew install fzf${RESET}"
        exit 1
    }
}

# Check required dependencies
require "fzf"
require "pbpaste"
require "pbcopy"

# ---------------------------------------------
# Initialize history file if it doesn't exist
# ---------------------------------------------
[[ -f "${HISTORY_FILE}" ]] || touch "${HISTORY_FILE}"

# ---------------------------------------------
# Function: main_menu
# Displays the main interactive menu and handles user input
# ---------------------------------------------
main_menu() {
    while true; do
        clear
        echo "${BOLD}${FG_BLUE}=== Clipboard Manager ===${RESET}"
        echo "1. Save current clipboard content"
        echo "2. Browse and paste from history"
        echo "3. Clear clipboard history"
        echo "4. Exit"
        read -k "choice?${BOLD}Select an option [1-4]:${RESET} "

        case ${choice} in
            1) add_to_history ;;
            2) show_history ;;
            3) clear_history ;;
            4) exit 0 ;;
            *)
                echo "\n${FG_RED}Invalid choice! Please select 1-4.${RESET}"
                sleep 1
                ;;
        esac
    done
}

# ---------------------------------------------
# Function: add_to_history
# Saves current clipboard content to history file
# Ensures uniqueness and limits history size
# ---------------------------------------------
add_to_history() {
    # Read clipboard content, remove null bytes if any
    local content=$(pbpaste | tr -d '\0')

    # If clipboard is empty, notify and return
    if [[ -z "${content}" ]]; then
        echo "\n${FG_RED}Clipboard is empty! Nothing to save.${RESET}"
        sleep 1
        return
    fi

    # Remove existing identical entries to avoid duplicates
    grep -Fvx "${content}" "${HISTORY_FILE}" > "${HISTORY_FILE}.tmp"
    # Append new clipboard content to the end of the temp file
    echo "${content}" >> "${HISTORY_FILE}.tmp"
    # Replace original history file with updated temp file
    mv "${HISTORY_FILE}.tmp" "${HISTORY_FILE}"

    # Keep only the last MAX_ENTRIES lines to limit history size
    tail -n "${MAX_ENTRIES}" "${HISTORY_FILE}" > "${HISTORY_FILE}.tmp"
    mv "${HISTORY_FILE}.tmp" "${HISTORY_FILE}"

    echo "\n${FG_GREEN}Current clipboard content saved to history!${RESET}"
    sleep 1
}

# ---------------------------------------------
# Function: show_history
# Opens clipboard history in fzf for interactive selection
# Copies selected entry back to clipboard
# ---------------------------------------------
show_history() {
    # Check if history file is empty
    if [[ ! -s "${HISTORY_FILE}" ]]; then
        echo "\n${FG_RED}Clipboard history is empty!${RESET}"
        sleep 1
        return
    fi

    # Use fzf for interactive selection with reverse layout and search prompt
    local selection=$(fzf --reverse --height=40% --prompt="Search clipboard history: " < "${HISTORY_FILE}")

    # If no selection made (fzf canceled), just return
    if [[ -z "${selection}" ]]; then
        return
    fi

    # Copy selected content to clipboard
    echo -n "${selection}" | pbcopy

    # Show confirmation and pretty print content wrapped at 80 chars width
    echo "\n${FG_GREEN}Copied to clipboard:${RESET}"
    echo "${selection}" | fold -s -w 80

    echo "\n${BOLD}Press Enter to continue...${RESET}"
    read -k
}

# ---------------------------------------------
# Function: clear_history
# Empties the clipboard history file
# ---------------------------------------------
clear_history() {
    : > "${HISTORY_FILE}"
    echo "\n${FG_GREEN}Clipboard history cleared!${RESET}"
    sleep 1
}

# ---------------------------------------------
# Script entry point: start the interactive menu
# ---------------------------------------------
main_menu
