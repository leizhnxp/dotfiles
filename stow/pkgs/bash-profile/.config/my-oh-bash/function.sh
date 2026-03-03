# Shared shell functions for both bash and zsh
# Primary location: bash-profile package, sourced by zsh-omz package

# Create a new directory and cd into it
mkcd() {
    if [[ $# -eq 1 ]]; then
        mkdir -p "$1" && cd "$1"
    else
        echo "Usage: mkcd <directory_name>"
    fi
}

# Extract various archive types
extract() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *.xz)        unxz "$1"        ;;
            *.lzma)      unlzma "$1"      ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Find files by name (case-insensitive)
findf() {
    if [[ $# -eq 1 ]]; then
        find . -type f -iname "*$1*" 2>/dev/null
    else
        echo "Usage: findf <filename_pattern>"
    fi
}

# Find directories by name (case-insensitive)
findd() {
    if [[ $# -eq 1 ]]; then
        find . -type d -iname "*$1*" 2>/dev/null
    else
        echo "Usage: findd <directory_pattern>"
    fi
}

# Quick backup of a file
backup() {
    if [[ -f "$1" ]]; then
        cp "$1" "${1}.backup-$(date +%Y%m%d_%H%M%S)"
        echo "Backup created: ${1}.backup-$(date +%Y%m%d_%H%M%S)"
    else
        echo "Usage: backup <filename>"
    fi
}

# Show disk usage of current directory
duh() {
    du -sh * | sort -hr
}

# Process search
psg() {
    if [[ $# -eq 1 ]]; then
        ps aux | grep -v grep | grep -i "$1"
    else
        echo "Usage: psg <process_name>"
    fi
}

# Quick note-taking function
note() {
    local note_file="$HOME/notes.txt"
    if [[ $# -eq 0 ]]; then
        # Show existing notes
        if [[ -f "$note_file" ]]; then
            cat "$note_file"
        else
            echo "No notes found. Use 'note <text>' to add a note."
        fi
    else
        # Add a new note with timestamp
        echo "$(date '+%Y-%m-%d %H:%M:%S'): $*" >> "$note_file"
        echo "Note added: $*"
    fi
}