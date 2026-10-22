---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },

	opts = {
		ensure_installed = {
			-- Core
			"lua",
			"vim",
			"vimdoc",

			-- Go
			"go",
			"gomod",
			"gosum",

			-- Web & Frontend
			"html",
			"css",
			"scss",
			"javascript",
			"typescript",
			"tsx",
			"jsx",

			-- Backend
			"php",
			"blade", -- ✨ Blade parser ditambahkan

			-- Data / Config
			"sql",
			"dockerfile",
			"yaml",
			"json",
			"toml",

			-- Scripting & Docs
			"bash",
			"markdown",
			"markdown_inline",
		},

		auto_install = false,

		highlight = {
			enable = true,

			disable = function(_, buf)
				local name = vim.api.nvim_buf_get_name(buf)
				if name:match("^neo%-tree://") or name == "" then
					return true
				end
				return false
			end,

			additional_vim_regex_highlighting = false,
		},

		indent = { enable = true },
	},

	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
