require "nvim-lsp-installer".setup()

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