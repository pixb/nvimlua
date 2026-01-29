# nvimlua

我的neovim配置, 抱着学习的态度，完全掌控的自己的配置慢慢打磨。

## 快捷键

快捷键是使用的关键, 所以放在最前面。

### 模式切换

模式切换 <kbd>j</kbd><kbd>k</kbd>

### 窗口焦点切换

- <kbd>Ctrl</kbd>+<kbd>h</kbd>: 焦点切换左窗口
- <kbd>Ctrl</kbd>+<kbd>j</kbd>: 焦点切换下窗口
- <kbd>Ctrl</kbd>+<kbd>k</kbd>: 焦点切换上窗口
- <kbd>Ctrl</kbd>+<kbd>l</kbd>: 焦点切换下窗口

### 窗口大小调整

- <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Up</kbd>: 窗口向上下扩大
- <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Down</kbd>: 窗口上下缩小
- <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Left</kbd>: 窗口左右缩小
- <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Right</kbd>: 窗口左右扩大

### 行移动

- <kbd>Shift</kbd>+<kbd>j</kbd>: 行下移
- <kbd>Shift</kbd>+<kbd>k</kbd>: 行上移

### Buffer相关

- <kdb>Shift</kdb>+<kbd>h</kbd>: 上一个Buffer
- <kdb>Shift</kdb>+<kbd>l</kbd>: 下一个Buffer
- <kdb>[</kdb>+<kbd>b</kbd>: 上一个Buffer
- <kdb>]</kdb>+<kbd>b</kbd>: 下一个Buffer
- <kdb>LEADER<kdb>+<kbd>b</kbd><kbd>b</kbd>: 另一个Buffer
- <kdb>LEADER<kdb>+<kbd>`</kbd>: 另一个Buffer

### 文件浏览器nvim-tree

| 按键 | 说明 |
| -------------- | --------------- |
| <kbd>LEADER</kbd> + <kbd>E</kbd> | 打开/关闭文件浏览器 |
| <kbd>LEADER</kbd> + <kbd>F</kbd> | 定位当前文件 |

## 选项

| 设置 leader 键配置 | 说明 |
| -------------- | --------------- |
| `vim.g.mapleader = " "` | LEADER |
| `vim.g.maplocalleader = "\\"`|LOCALLEADER|

| 基本配置 | 说明 |
| -------------- | --------------- |
|`vim.opt.number = true`|  显示行号|
|`vim.opt.relativenumber = true`|  显示相对行号|
|`vim.opt.cursorline = true`|  显示光标所在行的高亮|
|`vim.opt.signcolumn = "yes"`| 显示侧边栏符号|
|`vim.g.autoformat = true`| 自动格式化 |

| 缩进设置 | 说明 |
| -------------- | --------------- |
|`vim.opt.tabstop = 4`| 制表符宽度为4|
|`vim.opt.shiftwidth = 4`| 自动缩进宽度为4|
|`vim.opt.expandtab = true`| 将制表符转换为空格|
|`vim.opt.smartindent = true`| 智能缩进|

| 搜索设置 | 说明 |
| -------------- | --------------- |
|`vim.opt.smartindent = true`| 智能缩进|
|`vim.opt.ignorecase = true`| 搜索时忽略大小写|
|`vim.opt.smartcase = true`| 智能大小写搜索|
|`vim.opt.hlsearch = true`| 搜索时高亮匹配项|
|`vim.opt.incsearch = true`| 输入搜索模式时实时高亮|

| 文件处理 | 说明 |
| -------------- | --------------- |
|`vim.opt.autoread = true`| 自动读取外部修改的文件|

剪贴板

```c
-- 剪贴板
opt.clipboard = "unnamedplus"
-- 如果是在 SSH 环境下，利用 OSC 52 协议同步剪贴板
if vim.env.SSH_CONNECTION then
    vim.g.clipboard = {
        name = 'OSC 52',
        copy = {
            ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
            ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
        },
        paste = {
            ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
            ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
        },
    }
end
```

## 2026-01-26

- checkout main branch
- 删除旧的配置重新开始

### 配置基础选项

- 配置目录 `lua/config/options.lua`

`init.lua` 引入配置：

```lua
require("config.options")
```

- 配置快捷键 `lua/config/keymaps.lua`

### 引入插件管理器[lazy.nvim](https://github.com/folke/lazy.nvim)

- 配置到 `lua/config/lazy.lua`
- 参考笔记
  - [001_lazy_nvim.md](https://github.com/pixb/ai-neovim-study/note/plugin/001_lazy_nvim.md)
参考Demo:
  - [plugin-001-lazy-nvim](https://github.com/pixb/ai-neovim-study/config-demo/plugin-001-lazy-nvim)

### 安装gruvbox主题

- `lua/plugins/ui/gruvbox.lua`

### 安装文件浏览插件和图标插件

- `lua/plugins/ui/nvim-tree.lua`
- `lua/plugins/ui/nvim-web-devicons.lua`

配置快捷键 `lua/config/keymap.lua`

```lua
-- 切换文件树
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = '切换文件树' })

-- 定位当前文件
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', { noremap = true, silent = true, desc = '定位当前文件' })
```

### 参考LazyVim配置选项

```lua
-- localleader
vim.g.maplocalleader = "\\"
-- 自动格式化
vim.g.autoformat = true
```

### 处理剪贴板设置

```c
vim.opt.clipboard = "unnamedplus"

if vim.env.SSH_CONNECTION then
    vim.g.clipboard = {
        name = "OSC 52",
        copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
            ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        paste = {
            ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
            ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
        },
    }
end
```

### 参考 LazyVim 配置option

- [LazyVim](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua)
- 抄了大量的选项配置

### 参考 LazyVim 配置keymaps

- [LazyVim](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua)
- 抄了大量的选项配置

### 引入folke/snacks.nvim

- 工具插件，包含大量功能
- Buffer相关使用

```lua
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
    config = function(_, opts)
      local notify = vim.notify
      require("snacks").setup(opts)
    end,
  },
  ```

### 创建全局配置

这个参考是 LazyVim 配置 bufferline 插件,需要用到全局配置的图标选项。

- [ui-plugin](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/ui.lua)
- 于是学着写配置
- `lua/config/init.lua`

## 2026-01-28

### snacks_explorer.lua

配置文件浏览器，采用 `folke/snacks.nvim`

- 配置复制根据 [snacks_explorer.lua](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/editor/snacks_explorer.lua)
- 目录 `/lua/plugins/editor/snacks_explorer.lua`
- 需要定位项目根目录 `root()` 的函数。

### 启动加载结构更换

- `lua/config/init.lua`,定义 `PixVim`
- `init.lua`,`PixVim.setup()` 启动

### root()函数定义

- 定义获取项目根目录的函数
- `lua/util/root.lua`

### 加载顺序

==整体流程==

 - `init.lua`
  - 加载 `lua/config/init.lua`
    - 加载 `lua/cofing/options.lua`
    - 加载 `lua/config/lazy.lua`
    - 加载 `lua/config/keymap.lua`
    - PixVim: 设置 `require("pixvim.util")`
    - `PixVim.config = M.config`
    - `PixVim.root.setup()`

==加载插件==

- 加载 `lua/config/lazy.lua`
 - `folke/lazy.nvim` 初始化
 - 加载 `lua/plugins/ui` 中插件
  - `bufferline.lua`
  - `gruvbox.lua`
  - `nvim-web-devicons.lua`
 - 加载 `lua/plugins/editor` 中插件
  - `snacks.lua`
