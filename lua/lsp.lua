require "nvim-lsp-installer".setup()

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Setup LSP
local lspconfig = require('lspconfig')
lspconfig.gopls.setup {
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
-- vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.formatting()]]
-- vim.cmd [[autocmd BufWritePre *.go lua goimports(1000)]]

function OrgImports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

vim.cmd [[autocmd BufWritePre *.go lua OrgImports(1000)]]

-- vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]


lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'P' }
      }
    }
  },
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
vim.cmd [[autocmd BufWritePost *.lua lua vim.lsp.buf.format()]]
-- local myVar = "hello"
lspconfig.tsserver.setup {
  on_attach = function(client)
    print "tsserver is attaching!!!"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
    client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = capabilities,
}
vim.cmd [[autocmd BufWritePre *.ts lua vim.lsp.buf.format()]]

lspconfig.clangd.setup {
  on_attach = function()
    print "clangd is attaching!!!"
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
