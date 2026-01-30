-- util init
local LazyUtil = require("lazy.core.util")
local M = {}
M.deprecated = require("pixvim.util.deprecated")

-- 元表实现动态加载
-- 当调用uitl动态加载util模块中的文件
-- 示例：PixVim = require("util") PixVim.root()
setmetatable(M, {
	-- 获取属性元方法
	__index = function(t, k)
		-- 如果 lazy.core.util 存在返回
		if LazyUtil[k] then
			return LazyUtil[k]
		end
    if M.deprecated[k] then
      return M.deprecated[k]()
    end
		t[k] = require("pixvim.util." .. k)
    M.deprecated.decorate(k, t[k])
		return t[k]
	end,
})

---@param name string
function M.get_plugin(name)
  return require("lazy.core.config").spec.plugins[name]
end

---@param name string
---@param path string?
function M.get_plugin_path(name, path)
  local plugin = M.get_plugin(name)
  path = path and "/" .. path or ""
  return plugin and (plugin.dir .. path)
end

---@param plugin string
function M.has(plugin)
  return M.get_plugin(plugin) ~= nil
end

---@param name string
function M.opts(name)
  local plugin = M.get_plugin(name)
  if not plugin then
    return {}
  end
  local Plugin = require("lazy.core.plugin")
  return Plugin.values(plugin, "opts", false)
end

---@param opts? LazyNotifyOpts
function M.deprecate(old, new, opts)
  M.warn(
    ("`%s` is deprecated. Please use `%s` instead"):format(old, new),
    vim.tbl_extend("force", {
      title = "PixVim",
      once = true,
      stacktrace = true,
      stacklevel = 6,
    }, opts or {})
  )
end


function M.is_win()
  return vim.uv.os_uname().sysname:find("Windows") ~= nil
end

---@param fn fun()
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      fn()
    end,
  })
end

return M
