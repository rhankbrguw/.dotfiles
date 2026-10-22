---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		features = {
			large_buf = { size = 1024 * 256, lines = 10000 },
			autopairs = true,
			cmp = true,
			diagnostics = { virtual_text = true, virtual_lines = false },
			highlighturl = true,
			notifications = true,
		},
		diagnostics = {
			virtual_text = true,
			underline = true,
		},
		options = {
			opt = {
				relativenumber = true,
				number = true,
				spell = false,
				signcolumn = "yes",
				wrap = false,
			},
			g = {},
		},
		mappings = {
			n = {
				-- Buffer navigation
				["]b"] = {
					function()
						require("astrocore.buffer").nav(vim.v.count1)
					end,
					desc = "Next buffer",
				},
				["[b"] = {
					function()
						require("astrocore.buffer").nav(-vim.v.count1)
					end,
					desc = "Previous buffer",
				},
				["<Leader>bd"] = {
					function()
						require("astroui.status.heirline").buffer_picker(function(bufnr)
							require("astrocore.buffer").close(bufnr)
						end)
					end,
					desc = "Close buffer from tabline",
				},

				-- Flutter
				["<leader>xr"] = {
					function()
						vim.cmd("split term://flutter run | wincmd J | resize 15 | startinsert")
					end,
					desc = "Flutter run",
				},
				["<leader>xw"] = {
					function()
						vim.cmd("split term://flutter run -d chrome | wincmd J | resize 15 | startinsert")
					end,
					desc = "Flutter web",
				},
				["<leader>xe"] = {
					function()
						vim.fn.jobstart("$HOME/Android/Sdk/emulator/emulator -avd Pixel_6_CLI", { detach = true })
						vim.notify("🚀 Launching Pixel 6 emulator...", vim.log.levels.INFO)
					end,
					desc = "Launch emulator",
				},
				["<leader>xq"] = {
					function()
						for _, buf in ipairs(vim.api.nvim_list_bufs()) do
							local name = vim.api.nvim_buf_get_name(buf)
							if name:match("flutter run") then
								local chan = vim.bo[buf].channel
								if chan then
									vim.api.nvim_chan_send(chan, "q\n")
								end
							end
						end
					end,
					desc = "Quit Flutter",
				},

				-- Terminal
				["<leader>tt"] = {
					function()
						for _, buf in ipairs(vim.api.nvim_list_bufs()) do
							if vim.bo[buf].buftype == "terminal" and vim.api.nvim_buf_is_loaded(buf) then
								for _, win in ipairs(vim.fn.win_findbuf(buf)) do
									vim.api.nvim_set_current_win(win)
									vim.cmd("startinsert")
									return
								end
								vim.cmd("split | wincmd J | resize 15 | startinsert")
								vim.api.nvim_win_set_buf(0, buf)
								return
							end
						end
						vim.cmd("split term://zsh | wincmd J | resize 15 | startinsert")
					end,
					desc = "Toggle terminal",
				},

				-- Git
				["<leader>Gg"] = {
					function()
						local cmd = vim.fn.executable("lazygit") == 1 and "lazygit" or "git status"
						vim.cmd("tabnew term://" .. cmd .. " | startinsert")
					end,
					desc = "Lazygit",
				},
				["<leader>Gs"] = {
					function()
						vim.cmd("!git add %")
						vim.notify("✓ Staged: " .. vim.fn.expand("%:t"), vim.log.levels.INFO)
					end,
					desc = "Stage file",
				},
				["<leader>Gc"] = {
					function()
						local msg = vim.fn.input("Commit message: ")
						if msg ~= "" then
							vim.cmd("!git commit -m '" .. msg .. "'")
						end
					end,
					desc = "Commit",
				},
				["<leader>Gp"] = {
					function()
						vim.cmd("split term://git push | resize 10")
					end,
					desc = "Push",
				},
				["<leader>Gl"] = {
					function()
						vim.cmd("split term://git log --oneline --graph --decorate -20 | resize 15")
					end,
					desc = "Log",
				},
				["<leader>Gd"] = {
					function()
						vim.cmd("split term://git diff | resize 20")
					end,
					desc = "Diff",
				},

				-- Docker
				["<leader>Du"] = {
					function()
						vim.cmd("split term://docker compose up | wincmd J | resize 15 | startinsert")
					end,
					desc = "Docker up",
				},
				["<leader>Dd"] = {
					function()
						vim.cmd("split term://docker compose down | wincmd J | resize 10")
					end,
					desc = "Docker down",
				},
				["<leader>Dl"] = {
					function()
						vim.cmd("split term://docker compose logs -f | resize 20")
					end,
					desc = "Docker logs",
				},
				["<leader>Ds"] = {
					function()
						vim.cmd("split term://docker compose ps | resize 10")
					end,
					desc = "Docker status",
				},
			},
			t = {
				["<C-x>"] = { [[<C-\><C-n>:close<CR>]], desc = "Hide terminal" },
			},
		},
	},
}
