local M = {}


M.version = "0.0.1" -- x-release-please-version
M.config = {
  -- icons used by other plugins
  -- stylua: ignore
  icons = {
    misc = {
      dots = "󰇘",
    },
    ft = {
      octo = " ",
      gh = " ",
      ["markdown.gh"] = " ",
    },
    dap = {
      Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint          = " ",
      BreakpointCondition = " ",
      BreakpointRejected  = { " ", "DiagnosticError" },
      LogPoint            = ".>",
    },
    diagnostics = {
      Error = " ",
      Warn  = " ",
      Hint  = " ",
      Info  = " ",
    },
    git = {
      added    = " ",
      modified = " ",
      removed  = " ",
    },
    kinds = {
      Array         = " ",
      Boolean       = "󰨙 ",
      Class         = " ",
      Codeium       = "󰘦 ",
      Color         = " ",
      Control       = " ",
      Collapsed     = " ",
      Constant      = "󰏿 ",
      Constructor   = " ",
      Copilot       = " ",
      Enum          = " ",
      EnumMember    = " ",
      Event         = " ",
      Field         = " ",
      File          = " ",
      Folder        = " ",
      Function      = "󰊕 ",
      Interface     = " ",
      Key           = " ",
      Keyword       = " ",
      Method        = "󰊕 ",
      Module        = " ",
      Namespace     = "󰦮 ",
      Null          = " ",
      Number        = "󰎠 ",
      Object        = " ",
      Operator      = " ",
      Package       = " ",
      Property      = " ",
      Reference     = " ",
      Snippet       = "󱄽 ",
      String        = " ",
      Struct        = "󰆼 ",
      Supermaven    = " ",
      TabNine       = "󰏚 ",
      Text          = " ",
      TypeParameter = " ",
      Unit          = " ",
      Value         = " ",
      Variable      = "󰀫 ",
    },
  },
}

local group = vim.api.nvim_create_augroup("PixVim", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "VeryLazy",
  callback = function()
  end
})

M.did_init = false
M._options = {} ---@type vim.wo|vim.bo

-- save some options to track defaults
M._options.indentexpr = vim.o.indentexpr
M._options.foldmethod = vim.o.foldmethod
M._options.foldexpr = vim.o.foldexpr

-- 1. 先定义 PixVim 工具模块,是util模块, 为其他模块提供基础
_G.PixVim = require("pixvim.util")
PixVim.config = M.config
-- 2. 加载基础选项（依赖 PixVim）
require("config.options")
-- 3. 加载 Lazy.nvim 插件管理器
require("config.lazy")
-- 4. 加载 LSP 配置
require("config.lsp")
-- 5. 加载快捷键配置（依赖 PixVim）
require("config.keymaps")
-- 6. 设置根目录检测
PixVim.root.setup()



return M
