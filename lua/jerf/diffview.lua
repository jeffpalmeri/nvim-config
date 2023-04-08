require("diffview").setup()


vim.api.nvim_set_keymap('n', '<leader>do', '<Cmd>DiffviewOpen<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dc', '<Cmd>DiffviewClose<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>df', '<Cmd>DiffviewFileHistory %<CR>', { noremap = true })
