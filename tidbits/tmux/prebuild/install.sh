#!/bin/bash

set -e

# 配置版本号（手动修改此处）
TMUX_VERSION="3.6a"

# 检测系统架构和平台
detect_platform() {
    local arch=$(uname -m)
    local os=$(uname -s | tr '[:upper:]' '[:lower:]')

    case "$arch" in
        x86_64)
            arch="x86_64"
            ;;
        aarch64|arm64)
            arch="arm64"
            ;;
        *)
            echo "不支持的架构: $arch"
            exit 1
            ;;
    esac

    echo "${os}-${arch}"
}

# 主安装流程
main() {
    local platform=$(detect_platform)
    local download_url="https://github.com/tmux/tmux-builds/releases/download/v${TMUX_VERSION}/tmux-${TMUX_VERSION}-${platform}.tar.gz"
    local install_dir="${HOME}/bin"
    local temp_dir=$(mktemp -d)

    echo "检测到平台: $platform"
    echo "安装版本: v${TMUX_VERSION}"
    echo "下载地址: $download_url"

    # 创建安装目录
    mkdir -p "$install_dir"

    # 下载
    echo "正在下载 tmux..."
    if ! curl -L --retry 3 --retry-delay 2 --connect-timeout 10 --max-time 300 -o "${temp_dir}/tmux.tar.gz" "$download_url"; then
        echo "下载失败，请检查网络连接或手动下载："
        echo "$download_url"
        rm -rf "$temp_dir"
        exit 1
    fi

    # 解压
    echo "正在解压..."
    tar -xzf "${temp_dir}/tmux.tar.gz" -C "$temp_dir"

    # 安装
    echo "正在安装到 ${install_dir}..."
    cp "${temp_dir}/tmux" "${install_dir}/tmux"
    chmod +x "${install_dir}/tmux"

    # 清理
    rm -rf "$temp_dir"

    echo "安装完成！"
    echo "tmux 版本:"
    "${install_dir}/tmux" -V
    echo ""
    echo "请确保 ${install_dir} 在你的 PATH 中"
}

main "$@"
