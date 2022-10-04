require('gitsigns').setup({
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 0,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>'
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "B", "<CMD>Gitsigns blame_line<CR>", opts)
