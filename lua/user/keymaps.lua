local opts = { noremap = true, silent = true }
local term_ops = { silent = true }

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

keymap("n", "<leader>l", "$", opts)
keymap("n", "<leader>h", "^", opts)

-- keymap("n", "<D-s>", "<cmd>w<CR>", opts)
keymap("n", ",l", "<cmd>w<CR>", opts)
