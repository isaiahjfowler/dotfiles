return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim" },
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		build = ":Neorg sync-parsers",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								journal = "~/notes/journal",
								projects = "~/notes/projects",
								dheam = "~/notes/projects/dheam",
								dowding = "~/notes/projects/dowding",
								devops = "~/notes/projects/devops",
							},
						},
					},
				},
			})
		end,
	},
}
