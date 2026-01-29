return {
	desc = "Snacks File Explorer",
	-- 推荐的插件
	recommended = true,
	"folke/snacks.nvim",
  priority = 1000,
  lazy = false,
	opts = { explorer = {} },
  config = function(_, opts)
    local notify = vim.notify
    require("snacks").setup(opts)
  end,
	keys = {
		{
			"<leader>fe",
			function()
				Snacks.explorer({ cwd = PixVim.root() })
			end,
			desc = "Explorer Snacks (root dir)",
		},
		{
			"<leader>fE",
			function()
				Snacks.explorer()
			end,
			desc = "Explorer Snacks (cwd)",
		},
		{ "<leader>e", "<leader>fe", desc = "Explorer Snacks (root dir)", remap = true },
		{ "<leader>E", "<leader>fE", desc = "Explorer Snacks (cwd)", remap = true },
	},
}
