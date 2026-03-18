#!/bin/bash

# Post-install script to resolve stow completion bootstrap problem
# Handles the chicken-and-egg issue where stow completion requires stow to install packages,
# but we want stow completion to make the installation process easier.

set -euo pipefail

# Colors for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Script directory: <repo>/stow/rc
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Stow root: <repo>/stow
STOW_ROOT="$(dirname "$SCRIPT_DIR")"
# Stow packages directory: <repo>/stow/pkgs
STOW_PACKAGES_DIR="$STOW_ROOT/pkgs"

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're running in bash
check_shell_compatibility() {
    if [ -z "${BASH_VERSION:-}" ]; then
        log_warning "This script provides bash completion features, but you're not running bash"
        log_warning "Shell detected: ${SHELL:-unknown}"
        log_warning "Completion setup will be skipped, but core packages will still be installed"
        return 1
    fi
    return 0
}

# Install core packages that enable stow completion
install_core_packages() {
    log_info "Installing core shell enhancement packages..."

    local packages=("bash-profile" "stow-bash-completion")
    local success=true

    for pkg in "${packages[@]}"; do
        if [ ! -d "$STOW_PACKAGES_DIR/$pkg" ]; then
            log_error "Package directory not found: $STOW_PACKAGES_DIR/$pkg"
            success=false
            continue
        fi

        log_info "Installing package: $pkg"
        if stow -S "$pkg" 2>/dev/null; then
            log_success "✓ Installed $pkg"
        else
            log_error "✗ Failed to install $pkg"
            success=false
        fi
    done

    if ! $success; then
        log_error "Some packages failed to install"
        return 1
    fi

    log_success "Core packages installed successfully"
    return 0
}

# Provide user guidance
show_usage_guidance() {
    echo
    log_info "=== Usage Guidance ==="

    echo "补全功能已安装到系统中。"
    echo

    echo "要使补全在当前及未来会话中生效："
    echo -e "  1. 重启shell或终端，或"
    echo -e "  2. 运行: ${YELLOW}source ~/.bash_profile${NC}"
    echo

    echo "安装其他stow包："
    echo -e "  ${YELLOW}stow -S <package-name>${NC}  # 安装包（支持Tab补全）"
    echo -e "  ${YELLOW}stow -D <package-name>${NC}  # 卸载包"
    echo -e "  ${YELLOW}stow -R <package-name>${NC}  # 重装包"
    echo
}

# Main execution
main() {
    echo "=== Stow Post-Install Setup ==="
    echo "Resolving stow completion bootstrap issue..."
    echo

    # Verify prerequisites
    if ! command -v stow >/dev/null 2>&1; then
        log_error "stow command not found. Please install stow first."
        exit 1
    fi

    if [ ! -d "$STOW_PACKAGES_DIR" ]; then
        log_error "Stow packages directory not found: $STOW_PACKAGES_DIR"
        log_error "Make sure you're running this script from the correct location"
        exit 1
    fi

    if [ ! -f "$HOME/.stowrc" ]; then
        log_warning "~/.stowrc not found. Run install.sh first to set up stow configuration."
        exit 1
    fi

    # Execute installation steps
    if ! install_core_packages; then
        log_error "Failed to install core packages"
        exit 1
    fi

    echo
    show_usage_guidance

    echo
    log_info "补全功能已安装完成！"
    echo -e "选择激活方式："
    echo -e "  1. ${YELLOW}exec -l \$SHELL${NC}    # 重启shell（推荐）"
    echo -e "  2. ${YELLOW}source ~/.bash_profile${NC}  # 重新加载配置"
    echo -e "  3. 手动重启终端"

    read -p "是否要重启shell? [y/N]: " restart_shell
    if [[ "$restart_shell" =~ ^[Yy]$ ]]; then
        log_info "正在重启shell..."
        exec -l "$SHELL"
    fi

    log_success "Post-install setup completed!"
}

# Execute main function
main "$@"