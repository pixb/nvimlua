-- 配置

-- 设置 leader 键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 基本配置
vim.opt.number = true -- 显示行号
vim.opt.relativenumber = true -- 显示相对行号
vim.opt.cursorline = true -- 显示光标所在行的高亮
vim.opt.signcolumn = "yes" -- 显示侧边栏符号

-- 缩进设置
vim.opt.tabstop = 4 -- 制表符宽度为4
vim.opt.shiftwidth = 4 -- 自动缩进宽度为4
vim.opt.expandtab = true -- 将制表符转换为空格
vim.opt.smartindent = true -- 智能缩进

-- 搜索设置
vim.opt.ignorecase = true -- 搜索时忽略大小写
vim.opt.smartcase = true -- 智能大小写搜索
vim.opt.hlsearch = true -- 搜索时高亮匹配项
vim.opt.incsearch = true -- 输入搜索模式时实时高亮

-- 文件处理
vim.opt.autoread = true -- 自动读取外部修改的文件

print("--option 加载完成")
