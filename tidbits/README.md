# Tidbits - Utility Scripts Collection

> 🔧 **Development and system administration tools**

Collection of utility scripts organized by function. Each tool is designed to be standalone and addresses specific workflow needs.

## 📁 Categories

```
tidbits/
├── git/                     # Git workflow utilities
├── tmux/                    # Terminal multiplexer tools
├── webi/                    # Web-based tool installers
├── pam/                     # Authentication utilities
└── create-super-user.sh     # System user creation
```

## 🛠️ Available Tools

### Git Workflow (`git/`)
**User Identity Scripts**
- `config-user-me.sh` - Configure personal Git identity
- `config-user-6639hk.sh` - Alternative Git identity

```bash
# Usage
~/dotfiles/tidbits/git/gist/config-user-me.sh
```

### Terminal Management (`tmux/`)
**SSH Agent & Session Tools**
- `reset_SSH_AUTH_SOCK.sh` - Fix SSH agent forwarding in tmux
- `oh-my-tmux/install.sh` - Oh My Tmux framework installation
- `prebuild/install.sh` - Pre-configured tmux setup

```bash
# Fix SSH agent in current tmux session
source ~/dotfiles/tidbits/tmux/gist/reset_SSH_AUTH_SOCK.sh
```

### Development Tools (`webi/`)
**Web-based Installation Scripts**
- `bat/` - Enhanced `cat` with syntax highlighting

Example from [bat/README.md](webi/gist/bat/README.md):
```bash
curl -sS https://webi.sh/bat | sh
source ~/.config/envman/PATH.env
```

### System Administration (`pam/`)
**Authentication Configuration**
- `install-and-config-pam-sudo.sh` - Enable SSH key-based sudo authentication

Features: OS detection, idempotent configuration, automatic service restart

```bash
# Requires root privileges
sudo ./install-and-config-pam-sudo.sh
```

### User Management
**System User Creation**
- `create-super-user.sh` - Create user with sudo privileges and SSH access

Features: Auto UID/GID assignment, configurable SSH keys, sudo timeout configuration

```bash
# Default user creation
sudo ./create-super-user.sh

# Custom user with SSH key
sudo ./create-super-user.sh "username" "ssh-ed25519 AAAAC3..."
```

## 🎯 Usage Patterns

### Common Workflows
```bash
# System setup workflow
sudo ~/dotfiles/tidbits/create-super-user.sh
sudo ~/dotfiles/tidbits/pam/pam_ssh_agent_auth/install-and-config-pam-sudo.sh

# Development workflow
~/dotfiles/tidbits/git/gist/config-user-me.sh
source ~/dotfiles/tidbits/tmux/gist/reset_SSH_AUTH_SOCK.sh
```

### Security Considerations
- **PAM SSH auth**: Only use on trusted systems where you control SSH keys
- **User creation**: Creates users with sudo privileges - review security impact
- **SSH keys**: Ensure `~/.ssh/authorized_keys` contains only trusted keys

## 🔧 System Requirements

- **Unix/Linux** with bash
- **Root privileges** for system administration tools
- **Tool-specific dependencies** as documented in individual scripts

## 📚 Related Documentation

- **[Main project](../README.md)** - Project overview and quick start
- **[Configuration management](../stow/README.md)** - GNU Stow guide
- **Individual tool guides** - Component-specific README files where available