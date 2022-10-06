vim.opt.termguicolors = true
require("bufferline").setup({
  options = {
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    }
  }
})
vim.api.nvim_set_keymap("n", "L", "<CMD>BufferLineCycleNext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "H", "<CMD>BufferLineCyclePrev<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "W", "<CMD>bd<CR>", { noremap = true })
