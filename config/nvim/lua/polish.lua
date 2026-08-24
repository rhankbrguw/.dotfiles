-- ============================================================================
-- polish.lua — Final custom tweaks & autocmds after all plugins load
-- ============================================================================

-- Suppress noisy Treesitter installation warnings
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local notify = vim.notify
		vim.notify = function(msg, level, opts)
			if msg:match("Installation not possible") or msg:match("nvim%-treesitter") then
				return
			end
			notify(msg, level, opts)
		end
	end,
})

-- Terminal navigation keymaps
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Terminal: Move left" })
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Terminal: Move down" })
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Terminal: Move up" })
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Terminal: Move right" })

-- Hide line numbers & sign column in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})

-- Auto-format & organize imports before saving Go files
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end,
})

-- Laravel indentation rules (for PHP & Blade)
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*/app/**.php", "*/routes/**.php", "*/config/**.php", "*.blade.php" },
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
	end,
})

return {}
