return {
	-- add gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		-- 不懒加载
		lazy = false,
		-- 优先级1000,确保在其他插件之前加载
		priority = 1000,
		-- 插件配置函数
		config = function()
			-- 应用 gruvbox 主题
			vim.cmd("colorscheme gruvbox")
		end,
	},
}
