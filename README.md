# 配置文件目录

此目录主要包含 **River 窗口管理器**及其相关工具的配置文件。

## 🎯 主要用途

本配置目录主要设计用于 **River 窗口管理器** 在 Wayland 环境下的使用。River 是一个动态平铺窗口管理器，提供了高效、可定制的桌面环境。

## 📁 目录结构说明

### 🌊 River 相关配置（核心）

#### `river/`
**River 窗口管理器的主要配置文件**
- `init` - River 初始化脚本，包含所有窗口管理器设置、快捷键绑定、工作区配置等
- `README.md` - River 配置的详细说明文档

这是最重要的配置目录，包含了窗口管理器的所有核心设置。

#### `waybar/`
**Wayland 状态栏配置**
- `config` - Waybar 状态栏配置文件
- 显示系统信息、时间、音量、网络等

Waybar 与 River 集成，在 River 启动时自动启动（见 `river/init` 配置）。

#### `foot/`
**Foot 终端模拟器配置**
- `foot.ini` - Foot 终端配置文件
- 作为 River 的默认终端使用（`Super + Enter` 启动）

### 🔧 其他配置

#### `fish/`
**Fish Shell 配置**
- `config.fish` - Fish shell 主配置文件
- `functions/` - 自定义函数
- `completions/` - 自动完成脚本
- `conf.d/` - 配置文件片段

#### `xfce4/`
**XFCE 桌面环境配置**（可选，用于其他会话）
- XFCE 面板、窗口管理器、桌面等配置
- 如果只使用 River，这些配置不会被使用

#### `Thunar/`
**Thunar 文件管理器配置**（XFCE 配套工具）
- XFCE 的文件管理器设置
- 在 River 环境下可单独使用

#### `dconf/`
**dconf 系统设置**（GNOME/GTK 应用配置）
- 用于 GNOME/GTK 应用程序的系统设置
- 字体、主题、图标等系统级配置

## 🚀 快速开始

### 使用 River 桌面环境

1. **确保 River 已安装**：
   ```bash
   # Arch Linux
   sudo pacman -S river rivertile swaybg wlr-randr foot waybar
   ```

2. **配置文件位置确认**：
   - 主配置：`~/.config/river/init`
   - 状态栏：`~/.config/waybar/config`
   - 终端：`~/.config/foot/foot.ini`

3. **启动 River**：
   - 从登录管理器选择 "River" 会话
   - 或手动启动：`river`

4. **查看详细文档**：
   - River 配置说明：`~/.config/river/README.md`

### 配置文件优先级

如果同时安装了多个桌面环境：
- **River**: 使用 `river/` 和 `waybar/` 配置
- **XFCE**: 使用 `xfce4/` 和 `Thunar/` 配置
- 其他配置（`fish/`、`dconf/` 等）在所有环境中共享

## 🔗 配置关联

### River 生态系统配置关系

```
River 窗口管理器 (river/init)
    │
    ├─→ Waybar 状态栏 (waybar/config)
    ├─→ Foot 终端 (foot/foot.ini)
    └─→ Fish Shell (fish/config.fish)
```

### 配置依赖

- **River** 是核心，独立运行
- **Waybar** 在 River 中自动启动（由 `river/init` 配置）
- **Foot** 作为默认终端（由 `river/init` 的快捷键配置）
- **Fish** 可在任何终端中使用

## 📝 配置管理建议

### 备份配置

定期备份重要配置：
```bash
# 备份 River 相关配置
tar -czf river-config-backup.tar.gz ~/.config/river ~/.config/waybar ~/.config/foot
```

### 版本控制

可以将配置加入 Git 版本控制：
```bash
cd ~/.config
git init
git add river/ waybar/ foot/ README.md
git commit -m "River 配置文件"
```

### 配置迁移

如果需要在其他系统上使用相同配置：
1. 复制 `river/`、`waybar/`、`foot/` 目录
2. 确保所有依赖软件包已安装
3. 根据需要调整硬件相关设置（如显示器配置）

## ⚙️ 自定义配置

### 修改 River 设置

编辑 `river/init` 文件：
- 快捷键绑定
- 窗口外观
- 工作区配置
- 启动程序

详细说明请参阅 `river/README.md`。

### 修改 Waybar

编辑 `waybar/config` 文件：
- 状态栏模块
- 样式和主题
- 位置和大小

### 修改 Foot 终端

编辑 `foot/foot.ini` 文件：
- 字体和大小
- 颜色主题
- 行为设置

## 🔍 配置文件查找

如果某个应用程序的配置找不到，可以：

1. **检查应用程序文档**：大多数应用程序会说明配置文件位置
2. **使用环境变量**：`$XDG_CONFIG_HOME`（默认 `~/.config`）
3. **检查手册页**：`man <应用程序名>` 通常会说明配置位置

## 📚 相关文档

- [River 配置文档](./river/README.md) - River 详细使用说明
- [River 官方 Wiki](https://github.com/riverwm/river/wiki)
- [Waybar Wiki](https://github.com/Alexays/Waybar/wiki)
- [Foot 文档](https://codeberg.org/dnkl/foot/wiki)

## 💡 提示

1. **配置文件权限**：确保 `river/init` 具有执行权限：`chmod +x ~/.config/river/init`
2. **配置验证**：修改配置后，重启应用程序以应用更改
3. **备份重要**：在修改配置前，建议先备份原文件
4. **文档参考**：遇到问题时，先查看 `river/README.md` 中的故障排除部分

## 📝 注意事项

- 本配置目录主要针对 **River 窗口管理器** 进行优化
- XFCE 相关配置（`xfce4/`、`Thunar/`）仅在其他会话中使用
- 某些配置可能需要根据硬件环境进行调整（如显示器设置）
- 建议在修改配置前先阅读相关文档

---

**主要用途**: River 窗口管理器配置  
**环境**: Wayland  
**主要组件**: River + Waybar + Foot + Fish Shell
