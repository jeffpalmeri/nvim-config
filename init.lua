require "user.options"
require "user.keymaps"
require "user.plugins"
-- require "user.colorscheme"
-- require "user.lsp
require "user.jeff-lsp"
-- require "user.cmp"
vim.opt.completeopt = {"menu", "menuone", "noselect"}
-- local cmp = require('cmp')

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  print "cmp not found"
  return
else
  print "cmp was actually found"
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')
lspconfig.gopls.setup{
  on_attach = function()
    print "gopls is attaching!!!"
    -- print( capabilities)
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

-- require "lspconfig".sumneko_lua.setup{
--   on_attach = function()
--     print "sumneko_lua started succesfully!!!"
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })  
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
--     vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
--     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
--     vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
--     vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
--     vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
--   end,
-- }

require "lspconfig".tsserver.setup{
  -- capabilities = capabilities,
  on_attach = function()
    print "tsserver started succesfully!!!"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })  
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
  end,
}
