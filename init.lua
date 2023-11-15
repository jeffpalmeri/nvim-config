require "user.options"
require "user.keymaps"
require "user.plugins"
-- require "user.colorscheme"
-- require "user.lsp
-- require "user.jeff-lsp"
require "completion"
require "treesitter"
-- require "autopairs"
require "_gitsigns"

-- require "jerf.bufferline"
-- require "jerf.smoothscroll"
-- require "jerf.toggle-term"
require "jerf.comment"
require "jerf.telescope"
require "jerf.nvimtree"
-- require "jerf.barbar"
require "jerf.colors"
require "jerf.null_ls"
require "jerf.diffview"
require "jerf.bqf"
require "jerf.luasnip"
require "lsp"

require "globals"

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- keymap("v", "M", "ygv<leader>gc<esc>p", opts)


-- local group = vim.api.nvim_create_augroup("jeff-augroup-1", { clear = true }) -- the { clear = true } is the default, but including here for now anyways
-- vim.api.nvim_create_autocmd("BufEnter", { command = "echo 'Hello from autocmd!'", group = group })


-- vim.api.nvim_set_hl(0, "hlsearchl", { fg = "#ffffff", bg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "Search", { fg = "#ffffff", bg = "#ffffff" })
--
-- This next lines sets the highlight search color to solid white when my cursor is on that text,
-- I left it on for a while because I was trying to learn more about highlight groups and neovim colors.
-- I'm leaving it here for future reference, but tcommenting it out for now because it's pretty annoying.
-- vim.api.nvim_set_hl(0, "IncSearch", { fg = "#ffffff", bg = "#ffffff" })

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

-- require("indent_blankline").setup {
--   -- for example, context is off by default, use this to turn it on
--   show_current_context = true,
--   show_current_context_start = true,
--   space_char_blankline = ' ',
--   show_trailing_blankline_indent = false,
--   max_indent_increase = 1
-- }


-- vim.api.nvim_buf_delete(1, {})

-- require('lualine').setup({
--   extensions = {'nvim-tree'}
-- })

local function toggleRelative()
  local curr = vim.opt.relativenumber._value
  -- print("My current relative number settings is: ", curr)
  -- print("My current relative number settings is: ", not curr)
  vim.opt.relativenumber = not curr
end

-- toggleRelative()
vim.api.nvim_create_user_command("ToggleRelativeLineNumber", toggleRelative, {})


--[[ local ft_to_parser = require "nvim-treesitter.parsers".filetype_to_parsername
-- ft_to_parser.apex = "java"
ft_to_parser.cls = "java"
-- ft_to_parser.trigger = "java" ]]
--
-- local ft_to_parser = require('nvim-treesitter.parsers').filetype_to_parsername
-- ft_to_parser.cls = 'java'


-- Ft_to_parser = require "nvim-treesitter.parsers".filetype_to_parsername
-- Ft_to_parser.trigger = "java"
-- Ft_to_parser.apex = "java"
-- Ft_to_parser.cls = "java" -- the someft filetype will use the pyt


-- vim.cmd [[autocmd BufNewFile,BufRead [Tt]odo.txt set filetype=todo autocmd BufNewFile,BufRead *.[Tt]odo.txt set filetype=todo]]
-- vim.cmd [[autocmd BufNewFile,BufRead *.cls set filetype=java]]
-- vim.cmd [[autocmd BufNewFile,BufRead *.trigger set filetype=java]]


vim.filetype.add({
  filename = {
    [".cls"] = "trigger",
    [".trigger"] = "trigger",
  },
  -- pattern = {
  --   ["req.*.txt"] = "config",
  --   ["env.*"] = "config",
  --   ["gitconf.*"] = "gitconfig",
  --   [".*/%.dockerignore"] = "gitignore",
  -- },
})

-- autocmd BufNewFile,BufRead *.ini setfiletype dosini
vim.cmd [[autocmd BufNewFile,BufRead *.trigger setfiletype trigger]]
vim.cmd [[autocmd BufNewFile,BufRead *.apex setfiletype trigger]]
vim.cmd [[autocmd BufNewFile,BufRead *.cls setfiletype cls]]
-- vim.cmd [[autocmd BufWritePre *.jsx lua vim.lsp.buf.format()]]
--
--
-- local parsers = require "nvim-treesitter.parsers"
-- local parser_config = parsers.get_parser_configs()
-- parser_config.jsonc.filetype_to_parsername = "json"
-- parser_config.trigger.filetype_to_parsername = "java"
-- local parsers = require "nvim-treesitter.parsers"
-- local parser_config = parsers.get_parser_configs()
--parser_config.jsonc.filetype_to_parsername = "java"
-- parser_config.trigger = {}
-- parser_config.trigger.filetype_to_parsername = "java"
-- P(parser_config)





vim.treesitter.language.register('python', 'someft') -- the someft filetype will use the python parser and queries.
-- Had to upgrade to nvim 0.9 for this to work. https://github.com/nvim-treesitter/nvim-treesitter#adding-parsers
vim.treesitter.language.register('java', 'trigger') -- the trigger filetype will use the java parser and queries.
vim.treesitter.language.register('java', 'cls') -- the trigger filetype will use the java parser and queries.


-- vim.cmd [[autocmd BufWritePre *.json lua vim.cmd('%!jq<CR>')]]
--
-- keymap("v", "M", "<Nop>", opts)
-- keymap("v", "M", "<leader>gc", opts)
-- keymap("n", "M", "<leader>gc", opts)


-- Define your custom function to execute when 'M' is pressed in visual mode
-- function MyCustomMapping()
--   -- Enter visual mode
--   -- vim.cmd("normal! gv")
--   -- Replace this line with your desired custom action
--   -- vim.cmd([[normal! <leader>gc]])
--   vim.cmd([[normal! <leader>gc]])
-- end
--
-- -- Create a mapping for 'M' in normal mode
-- keymap("n", "M", "<Nop>", opts)
-- vim.api.nvim_set_keymap("n", "M", ":lua MyCustomMapping()<CR>", { noremap = true, silent = true })
-- vim.keymap.set(
--   'n',
--   '<A-/>',
--   function()
--     return vim.v.count == 0 and api.toggle_current_linewise() or api.toggle_linewise_count()
--   end
-- )




-- local api = require('Comment.api')
-- local config = require('Comment.config'):get()

-- api.toggle.linewise('j' )
-- api.toggle.linewise.current()
-- api.toggle.linewise.count(count, config?)

-- api.toggle.blockwise('j', config?)
-- api.toggle.blockwise.current(motion?, config?)
-- api.toggle.blockwise.count(count, config?)

-- Toggle current line (linewise) using C-/
-- vim.keymap.set('n', '<C-m>', api.toggle.linewise.current)
-- vim.keymap.set('v', '<C-m>', api.toggle.linewise.current)

-- Toggle current line (blockwise) using C-\
-- vim.keymap.set('n', '<C-\\>', api.toggle.blockwise.current)

-- Toggle lines (linewise) with dot-repeat support
-- Example: <leader>gc3j will comment 4 lines
-- vim.keymap.set(
--     'n', '<leader>gc', api.call('toggle.linewise', 'g@'),
--     { expr = true }
-- )
--
-- -- Toggle lines (blockwise) with dot-repeat support
-- -- Example: <leader>gb3j will comment 4 lines
-- vim.keymap.set(
--     'n', '<leader>gb', api.call('toggle.blockwise', 'g@'),
--     { expr = true }
-- )
