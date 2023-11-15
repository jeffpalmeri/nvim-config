require('Comment').setup(
  {
    opleader = {
      ---Line-comment keymap
      line = '<leader>gc',
      ---Block-comment keymap
      block = '<leader>gb',
    },
  }
)

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- keymap("v", "M", "ygv<leader>gc<esc>p", opts)
keymap("n", "gc", "<Nop>", opts)
-- Unmap the default "gc" binding in normal mode
-- vim.api.nvim_del_keymap('n', 'gc')

keymap("n", "M", "<Nop>", opts)
-- keymap("n", "M", "<leader>gc3j", opts)
-- keymap("n", "M", "gc<leader>gc5j", opts)
-- keymap("n", "<leader>tq", "<leader>gc5j", opts)


-- keymap("v", "M", "<Nop>", opts)
-- keymap("v", "M", "<leader>gc", opts)
require('Comment.api')
