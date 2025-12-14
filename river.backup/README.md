# River 窗口管理器配置

此目录包含 River 窗口管理器的配置文件。

## 📁 文件结构

```
.config/river/
├── init          # River 初始化脚本（主要配置文件）
└── README.md     # 本文件
```

## 🚀 使用方法

### 首次设置

1. 确认配置文件位于正确位置：
   ```bash
   ~/.config/river/init
   ```

2. 添加执行权限：
   ```bash
   chmod +x ~/.config/river/init
   ```

3. 启动 River（从登录管理器或手动启动）：
   ```bash
   river
   ```

### 启动 River

- **从登录管理器**: 在登录管理器的会话列表中选择 "River"
- **手动启动**: 在终端中运行 `river` 命令

## ⌨️ 快捷键绑定列表

本配置使用 **Super 键（Windows/Meta 键）** 作为主修饰键。

### 基本操作

| 快捷键 | 操作 |
|--------|------|
| `Super + Enter` | 启动终端（foot） |
| `Super + Q` | 关闭活动窗口 |
| `Super + Shift + Q` | 退出 River |

### 窗口焦点移动（vim 风格）

| 快捷键 | 操作 |
|--------|------|
| `Super + H` | 焦点移至左侧窗口 |
| `Super + J` | 焦点移至下方窗口 |
| `Super + K` | 焦点移至上方窗口 |
| `Super + L` | 焦点移至右侧窗口 |

### 窗口移动

| 快捷键 | 操作 |
|--------|------|
| `Super + Shift + H` | 将窗口向左移动 |
| `Super + Shift + J` | 将窗口向下移动 |
| `Super + Shift + K` | 将窗口向上移动 |
| `Super + Shift + L` | 将窗口向右移动 |

### 浮动模式

| 快捷键 | 操作 |
|--------|------|
| `Super + Space` | 切换浮动/平铺模式 |

### 工作区操作

| 快捷键 | 操作 |
|--------|------|
| `Super + 1-9` | 切换到工作区 1-9 |
| `Super + Shift + 1-9` | 将活动窗口移动到工作区 1-9 |

## 🎨 自定义设置

### 修改颜色

要修改窗口边框颜色，请编辑 `init` 文件中的以下行：

```bash
riverctl border-color-focused 0x88c0d0     # 焦点窗口的颜色
riverctl border-color-unfocused 0x3b4252   # 非焦点窗口的颜色
```

颜色使用十六进制格式指定（例如: `0xRRGGBB`）。

### 修改快捷键绑定

要添加新的快捷键绑定，请在 `init` 文件中按以下格式添加：

```bash
riverctl map normal $MOD <按键> <操作>
```

可用操作的示例：
- `spawn <命令>` - 执行命令
- `close` - 关闭窗口
- `toggle-float` - 切换浮动模式
- `focus-view <方向>` - 移动窗口焦点
- `move-view <方向>` - 移动窗口

### 修改布局设置

要修改窗口之间的内边距，请编辑 rivertile 的启动选项：

```bash
rivertile -view-padding 6 -outer-padding 6 &
```

- `-view-padding`: 窗口之间的内边距（像素）
- `-outer-padding`: 屏幕边缘的内边距（像素）

### 修改背景

要修改背景颜色，请编辑 swaybg 的设置：

```bash
swaybg -c "#222222" &  # 修改颜色代码
```

或者，如果要使用背景图片：

```bash
swaybg -i /path/to/image.jpg &
```

### 修改显示器设置

如果使用物理显示器，请删除或注释掉虚拟机专用设置（最后几行）。

要修改分辨率或缩放：

```bash
wlr-randr --output <输出名称> --mode <宽度>x<高度> --scale <缩放> &
```

查看可用输出：

```bash
wlr-randr
```

### 修改状态栏（Waybar）

如果 Waybar 未正确显示，请检查：

1. Waybar 是否已安装：
   ```bash
   which waybar
   ```

2. Waybar 配置文件位置：
   ```
   ~/.config/waybar/config
   ```

3. 如果要禁用 Waybar，请在 `init` 文件中注释掉：
   ```bash
   # waybar &
   ```

## 📦 所需软件包

使用此配置需要以下软件包：

- `river` - River 窗口管理器本体
- `rivertile` - 平铺布局生成器
- `swaybg` - 背景设置工具
- `wlr-randr` - 显示器设置工具（通常包含在 wlr-randr 软件包中）
- `foot` - 终端模拟器（或您喜欢的终端）
- `waybar` - Wayland 状态栏（可选）

### Arch Linux 安装方法

```bash
sudo pacman -S river rivertile swaybg wlr-randr foot waybar
```

### 其他发行版

请使用您发行版的包管理器安装上述软件包。

## 🔧 故障排除

### 设置未生效

1. 确认 `init` 文件具有执行权限：
   ```bash
   chmod +x ~/.config/river/init
   ```

2. 重新启动 River。

3. 查看日志：
   ```bash
   river 2>&1 | tee /tmp/river.log
   ```

### 快捷键不起作用

1. 检查是否有其他应用程序使用相同的快捷键绑定。
2. 检查键盘布局是否正确设置（参考 `init` 文件中的键盘设置部分）。

### 终端无法启动

如果 `foot` 未安装，或想使用其他终端：

```bash
riverctl map normal $MOD Return spawn <您喜欢的终端>
```

示例：
- `alacritty`
- `kitty`
- `gnome-terminal`

### Waybar 未显示

1. 检查 Waybar 是否已安装：
   ```bash
   which waybar
   ```

2. 检查 Waybar 配置：
   ```bash
   ls ~/.config/waybar/
   ```

3. 手动启动 Waybar 测试：
   ```bash
   waybar
   ```

4. 查看错误日志：
   ```bash
   waybar 2>&1 | tee /tmp/waybar.log
   ```

## 💡 使用技巧

### 窗口管理

- **浮动模式**: 使用 `Super + Space` 可以让窗口脱离平铺布局，自由移动和调整大小
- **快速切换**: 使用 `Super + 1-9` 快速在不同工作区之间切换
- **窗口移动**: 使用 `Super + Shift + 方向键` 可以在不同工作区之间移动窗口

### 工作区使用

- 每个工作区可以独立管理，互不干扰
- 可以将相关应用集中在同一工作区
- 使用标签系统可以同时将窗口分配到多个工作区

### 自定义建议

1. **修改终端**: 如果不想使用 `foot`，修改 `init` 文件中的终端启动命令
2. **调整颜色**: 根据您的主题调整边框颜色和背景色
3. **添加启动程序**: 在背景设置后添加其他自动启动的程序

示例：
```bash
# 启动应用程序示例
firefox &
thunderbird &
```

## 📚 参考资料

- [River 官方文档](https://github.com/riverwm/river/wiki)
- [riverctl 手册](https://github.com/riverwm/river/wiki/Commands)
- [rivertile 文档](https://github.com/riverwm/rivertile)
- [Waybar 文档](https://github.com/Alexays/Waybar/wiki)

## 📝 许可证

这些配置文件可自由自定义使用。