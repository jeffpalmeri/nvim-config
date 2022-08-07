require "user.options"
require "user.keymaps"
require "user.plugins"
-- require "user.colorscheme"
-- require "user.lsp
require "user.jeff-lsp"

require('colorbuddy').colorscheme('gruvbuddy')

local ok, lspkind = pcall(require, "lspkind")
if not ok then
  return
else
  print "lspkind found but apperently not working wooooooo!!!"
end

-- Setup completion
vim.opt.completeopt = {"menu", "menuone", "noselect"}
local cmp = require "cmp"
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = cmp.config.window.bordered(),
  -- },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  -- sources = cmp.config.sources({
  --   { name = 'nvim_lsp' },
  --   { name = 'luasnip' }, -- For luasnip users.
  -- }, {
  --   { name = 'buffer' },
  -- }),
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'buffer', keyword_length = 5},
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      })
    }),
  },
  experimental = {
    -- native_menu = true,
    ghost_text = true,
  },
  view = {
    entries = "native"
    -- entries = {name = 'wildmenu', separator = '|' }
  }
  -- formatting = {
  --   -- Youtube: How to set up nice formatting for your sources.
  --   format = lspkind.cmp_format {
  --     -- with_text = true,
  --     -- mode = 'symbol', -- show only symbol annotations
  --     -- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
  --     menu = {
  --       buffer = "[buf]",
  --       nvim_lsp = "[LSP]",
  --       nvim_lua = "[api]",
  --       path = "[path]",
  --       luasnip = "[snip]",
  --       gh_issues = "[issues]",
  --       tn = "[TabNine]",
  --     },
  --     experimental = {
  --       native_menu = false,
  --       ghost_text = true,
  --     },
  --     view = {                                                
  --       entries = {name = 'wildmenu', separator = '|' }       
  --     },    
  --     before = function (entry, vim_item)
  --       print "Hello from within lspkind before function"
  --       return vim_item
  --     end
  --   },
  -- },
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Setup LSP
local lspconfig = require('lspconfig')
lspconfig.gopls.setup{
  on_attach = function()
    print "gopls is attaching!!!"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })  
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
  end,
  capabilities = capabilities,
}

lspconfig.sumneko_lua.setup{
  on_attach = function()
    print "Sumneko_lua is attaching!!!"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })  
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
  end,
  capabilities = capabilities,
}

lspconfig.tsserver.setup{
  on_attach = function()
    print "tsserver is attaching!!!"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })  
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
  end,
  capabilities = capabilities,
}


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}