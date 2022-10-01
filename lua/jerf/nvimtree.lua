
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  open_on_setup = true,
  disable_netrw = false,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.api.nvim_set_keymap("n", ",e", "<CMD>NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", ",f", "<CMD>NvimTreeFocus<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", ",,a", "<CMD>NvimTreeFindFile<CR>", { noremap = true })
