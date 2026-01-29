-- util init
local LazyUtil = require("lazy.core.util")
local M = {}

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
		t[k] = require("pixvim.util." .. k)
		return t[k]
	end,
})

return M
