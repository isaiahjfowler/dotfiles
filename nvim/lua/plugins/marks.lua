return {
	"kshenoy/vim-signature",

	config = function()
		function JumpToMark(mark_number)
			-- Define your mapping between numbers and marks here
			local mark_mapping = {
				"a",
				"b",
				"c",
				"d",
				"e",
				"f",
				"g",
				"h",
				"i",
				"j",
				-- Add more mappings as needed
			}

			-- Get the mark identifier from the mapping
			local mark_identifier = mark_mapping[mark_number]

			-- Check if the mark_identifier exists to avoid errors
			if mark_identifier then
				-- Use Neovim command to jump to the mark
				vim.cmd("normal! `" .. mark_identifier)
			else
				print("Invalid mark number")
			end
		end

		for i = 1, 9 do
			vim.api.nvim_set_keymap(
				"n",
				"m" .. i,
				"<cmd>lua JumpToMark(" .. i .. ")<CR>",
				{ noremap = true, silent = true }
			)
		end

		vim.api.nvim_set_keymap("n", "<M-]>", "]'", { noremap = true, silent = true })
		-- Cycle to the previous mark
		vim.api.nvim_set_keymap("n", "<M-[>", "[' ", { noremap = true, silent = true })
	end,
}

--
--
-- return {
-- 	"chentoast/marks.nvim",
-- 	config = function()
-- 		require("marks").setup({
-- 			-- whether to map keybinds or not. default true
-- 			default_mappings = true,
-- 			-- which builtin marks to show. default {}
-- 			builtin_marks = { ".", "<", ">", "^" },
-- 			-- whether movements cycle back to the beginning/end of buffer. default true
-- 			cyclic = true,
-- 			-- whether the shada file is updated after modifying uppercase marks. default false
-- 			force_write_shada = false,
-- 			-- how often (in ms) to redraw signs/recompute mark positions.
-- 			-- higher values will have better performance but may cause visual lag,
-- 			-- while lower values may cause performance penalties. default 150.
-- 			refresh_interval = 250,
-- 			-- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
-- 			-- marks, and bookmarks.
-- 			-- can be either a table with all/none of the keys, or a single number, in which case
-- 			-- the priority applies to all marks.
-- 			-- default 10.
-- 			sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
-- 			-- disables mark tracking for specific filetypes. default {}
-- 			excluded_filetypes = {},
-- 			-- disables mark tracking for specific buftypes. default {}
-- 			excluded_buftypes = {},
-- 			-- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
-- 			-- sign/virttext. Bookmarks can be used to group together positions and quickly move
-- 			-- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
-- 			-- default virt_text is "".
-- 			bookmark_0 = {
-- 				sign = "⚑",
-- 				virt_text = "hello world",
-- 				-- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
-- 				-- defaults to false.
-- 				annotate = false,
-- 			},
-- 			mappings = {},
-- 		})
--
-- 		vim.api.nvim_set_keymap("n", "<M-]>", ':lua require"marks".next()<CR>', { noremap = true, silent = true })
-- 		-- Cycle to the previous mark
-- 		vim.api.nvim_set_keymap("n", "<M-[>", ':lua require"marks".prev()<CR>', { noremap = true, silent = true })
--
-- 		for i = 1, 9 do
-- 			vim.api.nvim_set_keymap(
-- 				"n",
-- 				"m" .. i,
-- 				"<cmd>lua JumpToMark(" .. i .. ")<CR>",
-- 				{ noremap = true, silent = true }
-- 			)
-- 		end
-- 	end,
-- }
