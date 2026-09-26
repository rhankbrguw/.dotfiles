-- Mason Tool Installer Configuration
---@type LazySpec
return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- ======================================================================
				-- LANGUAGE SERVERS (LSP)
				-- ======================================================================
				"lua-language-server", -- Lua (Neovim config)
				"gopls", -- Go
				"intelephense", -- PHP/Laravel
				"typescript-language-server", -- TypeScript/JavaScript/React
				"tailwindcss-language-server", -- Tailwind CSS
				"dockerfile-language-server", -- Dockerfile
				"docker-compose-language-service", -- docker-compose.yml

				-- ======================================================================
				-- CODE FORMATTERS
				-- ======================================================================
				"stylua", -- Lua formatter
				"gofumpt", -- Go formatter
				"goimports", -- Go import organizer
				"prettier", -- JS/TS/React/CSS/HTML/JSON formatter
				"blade-formatter", -- Laravel Blade formatter

				-- ======================================================================
				-- LINTERS & STATIC ANALYSIS
				-- ======================================================================
				"eslint_d", -- JavaScript/React linter
				"phpstan", -- PHP static analyzer

				-- ======================================================================
				-- DEBUGGING & TOOLS
				-- ======================================================================
				"debugpy", -- Python debugger
				"delve", -- Go debugger
			},
		},
	},
}
