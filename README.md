# Personal Dotfiles Collection

> 🏠 **Modular configuration management system for Unix/Linux environments**

[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](LICENSE)
[![GitHub Mirror](https://img.shields.io/github/actions/workflow/status/leizhnxp/dotfiles/mirror.yml?label=mirror)](https://github.com/leizhnxp/dotfiles/actions)

## 🚀 Quick Actions

- **[5-Minute Setup](#5-minute-setup)** - Essential configs only
- **[Configuration Management](stow/README.md)** - GNU Stow guide
- **[Utility Tools](tidbits/README.md)** - Development scripts
- **[Commands Reference](#commands-reference)** - Quick command lookup

## 🎯 What This Provides

**Configuration Packages** (GNU Stow managed): Shell, Git, Vim, readline configurations
**Utility Scripts**: Git tools, tmux helpers, system administration scripts
**Documentation**: Comprehensive guides for setup and customization

### ✨ Key Benefits
- 🔗 Symlink-based management (no file copying)
- 📦 Modular deployment (install only what you need)
- 🔄 Cross-platform compatibility
- 📚 Well-documented with examples

## 🏗️ 5-Minute Setup

### Prerequisites
```bash
# Install GNU Stow
sudo apt install stow    # Debian/Ubuntu
brew install stow        # macOS
```

### Essential Installation
```bash
# 1. Clone repository
git clone https://github.com/leizhnxp/dotfiles.git ~/dotfiles

# 2. Initialize stow configuration
bash ~/dotfiles/stow/rc/install.sh

# 3. Enable stow completion (recommended)
bash ~/dotfiles/stow/rc/post-install.sh

# 4. Deploy essential configs (now with tab completion!)
stow -S bash-profile git-linux vim-native readline
```

**What you get**: Shell environment, Git configuration, Vim settings, command-line editing

> 📖 **For detailed installation options**, see [Configuration Management Guide](stow/README.md)

## ⚡ Commands Reference

| Task | Command |
|------|---------|
| **Deploy all configs** | `stow -S *` (with tab completion) |
| **Remove config** | `stow -D package-name` |
| **Configure Git identity** | `~/dotfiles/tidbits/git/gist/config-user-me.sh` |
| **Fix SSH in tmux** | `source ~/dotfiles/tidbits/tmux/gist/reset_SSH_AUTH_SOCK.sh` |
| **Create admin user** | `sudo ~/dotfiles/tidbits/create-super-user.sh` |

## 📁 Project Overview

```
dotfiles/
├── stow/                    # Configuration packages
│   ├── pkgs/               # Individual packages (bash, git, vim, etc.)
│   └── README.md           # Complete installation guide
├── tidbits/                # Utility scripts collection
│   ├── git/, tmux/, webi/, pam/  # Tool categories
│   └── README.md           # Tools documentation
└── README.md               # This overview
```

## 🧩 Available Configurations

| Package | Purpose | Files Managed |
|---------|---------|---------------|
| **bash-profile** | Shell environment setup | `~/.bash_profile`, aliases |
| **git-linux** | Git configuration (XDG) | `~/.config/git/config` |
| **vim-native** | Vim editor settings | `~/.vimrc` |
| **readline** | Command-line editing | `~/.inputrc` |
| **zsh-omz** | Oh My Zsh customizations | `~/.oh-my-zsh/custom/` |

> 📖 **Detailed usage**: [stow/README.md](stow/README.md)

## 🛠️ Utility Scripts Overview

| Category | Tools | Purpose |
|----------|-------|---------|
| **Git** | User config scripts | Set Git identity for different accounts |
| **Tmux** | SSH agent helpers | Fix SSH forwarding in tmux sessions |
| **Web Installers** | Development tools | Install via webinstall.dev |
| **System Admin** | User management | Create users with SSH key auth |

> 📖 **Complete tools guide**: [tidbits/README.md](tidbits/README.md)

## 📚 Documentation

### Component Guides
- **[stow/README.md](stow/README.md)** - Complete configuration management guide
- **[tidbits/README.md](tidbits/README.md)** - Utility tools reference
- **[stow/TODO.md](stow/TODO.md)** - Known limitations and improvements

### External References
- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/stow.html)
- [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)

## 📄 License

Released into the public domain under the [Unlicense](LICENSE). Free to use, modify, and distribute.

---

**Repository**: https://github.com/leizhnxp/dotfiles
**Mirror**: https://gitee.com/leizhnxp/dotfiles
