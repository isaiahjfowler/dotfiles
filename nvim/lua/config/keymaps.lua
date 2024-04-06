local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap



--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--
--

keymap('n', 'f', ':HopWord<CR>', {noremap = true})
keymap('n', 't', ':HopChar1MW<CR>', {noremap = true})

keymap('n', '<M-f>', ':term fish ~/.config/scripts/tmux-sessionizer.fish<CR>i', opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-x", "<C-w>q", opts)


-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


-- Telescope --
keymap('n', '<M-p>', ":Telescope find_files<CR>", opts)
keymap('n', '<leader>fg', ":Telescope live_grep<CR>",  opts)
keymap('n', '<leader>fb',  ":Telescope Buffers<CR>",   opts)
keymap('n', '<leader>fh', ":Telescope live_tags<CR>",  opts)
keymap("n", '<leader>fb', ":Telescope file_browser path=%:p:h select_buffer=true<CR>", opts)


-- Harpoon -- 
keymap("n", '<A-`>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
keymap("n", '<A-m>', ':lua require("harpoon.mark").add_file()<CR>', opts)

for i = 1, 9 do
   keymap("n", string.format('<A-%d>', i), string.format(':lua require("harpoon.ui").nav_file(%d)<CR>', i), opts)
end

-- Oil -- 
keymap("n", "-", "<CMD>Oil<CR>", opts)
