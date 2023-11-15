local opts = { noremap = true, silent = true }
-- local term_ops = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
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

keymap('i', 'jk', '<ESC>', opts)
keymap('n', '<C-j>', '<C-e>', opts)
keymap('n', '<C-k>', '<C-y>', opts)

keymap("n", "<leader>l", "$", opts)
keymap("n", "<leader>h", "^", opts)

-- keymap("n", "<D-s>", "<cmd>w<CR>", opts)
keymap("n", ",l", "<cmd>w<CR>", opts)

keymap("n", "<leader><leader>x", "<CMD>source %<CR>", opts)
-- nnoremap <leader><leader>v :w<CR>:Vader %<CR>

-- I tried mapping these here but doesn't seem to be working. So rn I just have iterm mapping to things like <C-w>l
keymap("n", "<D-l>", "<C-w>l", opts)
keymap("n", "<D-h>", "<C-w>h", opts)
keymap("n", "<D-j", "<C-w>j", opts)
keymap("n", "<D-k>", "<C-w>k", opts)

-- copen, ccl
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "n", "nzz", opts)

keymap("i", "\\s", "<esc><cmd>w<CR>", opts)
keymap("n", "\\s", "<cmd>w<CR>", opts)

keymap("n", "\\rl", "<cmd>ToggleRelativeLineNumber<CR>", opts)

keymap("n", "<C-e>", "5<C-e>", opts)
keymap("n", "<C-y>", "5<C-y>", opts)
keymap("v", "<C-e>", "5<C-e>", opts)
keymap("v", "<C-y>", "5<C-y>", opts)
keymap("n", "<C-p>", "<cmd>Ex<CR>", opts)

keymap("n", "<leader>hj", "<cmd>%!jq<CR>", opts)
keymap("n", "<leader>te", "<cmd>vs<CR><cmd>terminal<CR>A", opts)
keymap("t", "<leader>to", "<C-w><C-N>", opts)
keymap("t", "<leader>ta", "<C-\\><C-N>", opts)

keymap("v", "m", "ygv<esc>p", opts)
keymap("n", "m", "yyp", opts)
-- keymap("v", "M", "ygv<leader>gc<esc>p", opts)
