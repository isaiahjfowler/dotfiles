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

return {
	"chentoast/marks.nvim",
	config = function()
		require("marks").setup()

		vim.api.nvim_set_keymap("n", "<M-]>", ':lua require"marks".next()<CR>', { noremap = true, silent = true })

		-- Cycle to the previous mark
		vim.api.nvim_set_keymap("n", "<M-[>", ':lua require"marks".prev()<CR>', { noremap = true, silent = true })

		for i = 1, 9 do
			vim.api.nvim_set_keymap(
				"n",
				"m" .. i,
				"<cmd>lua JumpToMark(" .. i .. ")<CR>",
				{ noremap = true, silent = true }
			)
		end
	end,
}
