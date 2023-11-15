require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    prompt_prefix = "$ ",
    -- prompt_position = "bottom",
    layout_strategy = 'horizontal',
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<leader>db"] = require('telescope.actions').delete_buffer
      },
      n = {
        ["<leader>db"] = require('telescope.actions').delete_buffer
      }
    }
  },
  pickers = {
    find_files = {
      find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
      hidden = true,
    }
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}


vim.api.nvim_set_keymap('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fy', '<Cmd>Telescope find_files search_dirs={".build"}<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gr', '<Cmd>Telescope grep_string<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lg', '<Cmd>Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gs', '<Cmd>Telescope git_status<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<Cmd>Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ql', '<Cmd>Telescope quickfix<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ht', '<Cmd>Telescope help_tags<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tr', '<Cmd>Telescope resume<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>di', '<Cmd>Telescope diagnostics<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lr', '<Cmd>Telescope lsp_references<CR>', { noremap = true })
-- require("telescope.builtin").live_grep({search_dirs={vim.fn.expand("%:p")}}) live_grep on single file only, from reddit
-- require('telescope.builtin').live_grep({grep_open_files=true})
vim.api.nvim_set_keymap('n', '<leader>gw', 'yiw<Cmd>Telescope live_grep<CR><C-r>"<Del><ESC>', { noremap = true }) -- This is not quite working correctly... maybe it is now, not sure.
