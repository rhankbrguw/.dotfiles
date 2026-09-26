-- None-ls (null-ls) Configuration
---@type LazySpec
return {
	"nvimtools/none-ls.nvim",
	opts = function(_, opts)
		local null_ls = require("null-ls")

		opts.sources = require("astrocore").list_insert_unique(opts.sources, {
			-- ======================================================================
			-- GO LANGUAGE TOOLING
			-- ======================================================================
			null_ls.builtins.formatting.gofumpt, -- Go formatter
			null_ls.builtins.formatting.goimports, -- Import organizer

			-- ======================================================================
			-- PHP / LARAVEL TOOLING
			-- ======================================================================
			null_ls.builtins.diagnostics.phpstan, -- Static analysis
			null_ls.builtins.formatting.blade_formatter, -- Laravel Blade formatter

			-- ======================================================================
			-- JAVASCRIPT / REACT / TAILWIND
			-- ======================================================================
			null_ls.builtins.formatting.prettier.with({
				extra_filetypes = { "blade" }, -- Also format Blade files
			}),
			null_ls.builtins.diagnostics.eslint_d, -- Fast ESLint linting

			-- ======================================================================
			-- LUA (for Neovim config)
			-- ======================================================================
			null_ls.builtins.formatting.stylua, -- Lua formatter
		})
	end,
}
