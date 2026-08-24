-- ============================================================================
-- lazy_setup.lua — Main Lazy configuration for AstroNvim
-- ============================================================================

require("lazy").setup({
	{
		"AstroNvim/AstroNvim",
		version = "^5",
		import = "astronvim.plugins",
		opts = {
			mapleader = " ", -- Leader key
			maplocalleader = ",", -- Local leader
			icons_enabled = true, -- Enable icons (requires Nerd Font)
			pin_plugins = nil, -- Auto pin versions with AstroNvim updates
			update_notifications = true,
		},
	},

	-- Community plugins (must load before custom ones)
	{ import = "community" },

	-- User-defined plugins
	{ import = "plugins" },
}, {
	install = { colorscheme = { "astrotheme", "habamax" } },
	ui = { backdrop = 100 },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
			},
		},
	},
})
