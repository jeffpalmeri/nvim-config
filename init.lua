require "user.options"
require "user.keymaps"
require "user.plugins"
-- require "user.colorscheme"
-- require "user.lsp
-- require "user.jeff-lsp"
require "completion"
require "lsp"
require "treesitter"
require "autopairs"
require "_gitsigns"

-- require "jerf.bufferline"
require "jerf.smoothscroll"
require "jerf.toggle-term"
require "jerf.comment"
require "jerf.telescope"
require "jerf.nvimtree"
require "jerf.barbar"
require "jerf.colors"

require "globals"

-- local group = vim.api.nvim_create_augroup("jeff-augroup-1", { clear = true }) -- the { clear = true } is the default, but including here for now anyways
-- vim.api.nvim_create_autocmd("BufEnter", { command = "echo 'Hello from autocmd!'", group = group })


-- vim.api.nvim_set_hl(0, "hlsearchl", { fg = "#ffffff", bg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "Search", { fg = "#ffffff", bg = "#ffffff" })
vim.api.nvim_set_hl(0, "IncSearch", { fg = "#ffffff", bg = "#ffffff" })

-- local hl = require 'bufferline.utils'.hl
-- hl.set_default_link('BufferCurrent', "#ffffff")

local out = vim.fn.systemlist({ "git", "status", "--porcelain=v1" })
-- print("**99", out)
print("*****???", P(out))
for index, value in ipairs(out) do
  print(index)
  print(value)
end

Find_buffer_by_name = function(name)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if buf_name == name then
      return buf
    end
  end
  return -1
end


for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  local buf_name = vim.api.nvim_buf_get_name(buf)
  print("buf name: ", buf_name)
end

vim.api.nvim_buf_delete(1, {})

