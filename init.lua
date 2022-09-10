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
-- require('colorbuddy').colorscheme('gruvbuddy')

require "globals"
--[[
-- require('colorbuddy').colorscheme('gruvbuddy')
vim.o.background = 'dark'

local c = require('vscode.colors')
require('vscode').setup({
    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})
]]
---[[
local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
--]]
-- local ok, lspkind = pcall(require, "lspkind")
-- if not ok then
--   return
-- end

-- -- Setup completion
-- vim.opt.completeopt = {"menu", "menuone", "noselect"}
-- local cmp = require "cmp"
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--     end,
--   },
--   -- window = {
--   --   completion = cmp.config.window.bordered(),
--   --   documentation = cmp.config.window.bordered(),
--   -- },
--   mapping = cmp.mapping.preset.insert({
--     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-e>'] = cmp.mapping.abort(),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--   }),
--   sources = {
--     { name = 'nvim_lua' },
--     { name = 'nvim_lsp' },
--     { name = 'luasnip' }, -- For luasnip users.
--     { name = 'buffer', keyword_length = 5},
--   },
--   formatting = {
--     format = lspkind.cmp_format({
--       mode = "symbol_text",
--       menu = ({
--         buffer = "[Buffer]",
--         nvim_lsp = "[LSP]",
--         luasnip = "[LuaSnip]",
--         nvim_lua = "[Lua]",
--         latex_symbols = "[Latex]",
--       })
--     }),
--   },
--   experimental = {
--     -- native_menu = true,
--     ghost_text = true,
--   },
--   view = {
--     entries = "native"
--     -- entries = {name = 'wildmenu', separator = '|' }
--   }
-- })

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- Setup LSP
-- local lspconfig = require('lspconfig')
-- lspconfig.gopls.setup{
--   on_attach = function()
--     print "gopls is attaching!!!"
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
--     vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
--     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
--     vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
--     vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
--     vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
--   end,
--   capabilities = capabilities,
-- }

-- lspconfig.sumneko_lua.setup{
--   on_attach = function()
--     print "Sumneko_lua is attaching!!!"
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
--     vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
--     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
--     vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
--     vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
--     vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
--   end,
--   capabilities = capabilities,
-- }

-- lspconfig.tsserver.setup{
--   on_attach = function()
--     print "tsserver is attaching!!!"
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
--     vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
--     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
--     vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
--     vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
--     vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
--   end,
--   capabilities = capabilities,
-- }


-- require'nvim-treesitter.configs'.setup {
--   -- A list of parser names, or "all"
--   ensure_installed = { "c", "lua", "rust" },

--   -- Install parsers synchronously (only applied to `ensure_installed`)
--   sync_install = false,
require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    prompt_prefix = "$ ",
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
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

-- require('telescope').



--   -- Automatically install missing parsers when entering buffer
--   auto_install = true,

--   -- List of parsers to ignore installing (for "all")
--   -- ignore_install = { "javascript" },

--   highlight = {
--     -- `false` will disable the whole extension
--     enable = true,

--     -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
--     -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
--     -- the name of the parser)
--     -- list of language that will be disabled
--     -- disable = { "c", "rust" },

--     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--     -- Using this option may slow down your editor, and you may see some duplicate highlights.
--     -- Instead of true it can also be a list of languages
--     additional_vim_regex_highlighting = false,
--   },
-- }
--

-- examples for your init.lua

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
---[[
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
--]]

-- vim.api.nvim_set_keymap("n", "<leader>ff","<CMD>NvimTreeToggle<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", ",e", "<CMD>NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", ",f", "<CMD>NvimTreeFocus<CR>", { noremap = true })


-- Set barbar's options
require 'bufferline'.setup {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  exclude_ft = { 'javascript' },
  exclude_name = { 'package.json' },

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}

vim.api.nvim_set_keymap('n', 'H', '<Cmd>BufferPrevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'L', '<Cmd>BufferNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'W', '<Cmd>BufferClose<CR>', { noremap = true })
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_state.set_offset(0)
end)
