#!/bin/bash

# 壁纸随机更换脚本
# 使用方法: wall.sh
# 或添加到快捷键: Super + w (已在 river/init 中配置)

# 壁纸目录路径
wallpaper_dir="$HOME/walls"

# 检查壁纸目录是否存在
if [ ! -d "$wallpaper_dir" ]; then
    echo "错误: 壁纸目录不存在: $wallpaper_dir"
    exit 1
fi

# 获取所有图片文件列表（支持 jpg, jpeg, png, gif, webp）
shopt -s nullglob
wallpapers=("$wallpaper_dir"/*.{jpg,JPG,jpeg,JPEG,png,PNG,gif,GIF,webp,WEBP})

# 检查是否有壁纸文件
if [ ${#wallpapers[@]} -eq 0 ]; then
    echo "错误: 在 $wallpaper_dir 中未找到壁纸文件"
    exit 1
fi

# 从列表中随机选择一张壁纸
selected_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

# 检查并设置 WAYLAND_DISPLAY 环境变量
if [ -z "$WAYLAND_DISPLAY" ]; then
    # 如果未设置，尝试自动检测
    if [ -n "$XDG_RUNTIME_DIR" ]; then
        # 查找所有可能的 Wayland 显示套接字
        for socket in wayland-0 wayland-1 river-0 river-1; do
            if [ -S "$XDG_RUNTIME_DIR/$socket" ]; then
                export WAYLAND_DISPLAY=$socket
                break
            fi
        done
    fi
    
    # 如果仍未找到，使用默认值
    if [ -z "$WAYLAND_DISPLAY" ]; then
        export WAYLAND_DISPLAY=wayland-0
    fi
fi

# 终止现有的 swaybg 进程（如果有的话）
pkill -x swaybg
sleep 0.1  # 短暂等待确保进程完全终止

# 设置新壁纸
swaybg -m fill -i "$selected_wallpaper" &

echo "壁纸已更换为: $(basename "$selected_wallpaper")"
