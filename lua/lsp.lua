require "nvim-lsp-installer".setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Setup LSP
local lspconfig = require('lspconfig')
lspconfig.gopls.setup {
  on_attach = function()
    print "gopls is attaching!!!"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gc", vim.lsp.buf.definition, { buffer = 0, nowait = true })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { buffer = 0 })
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


lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'P' }
      }
    }
  },
  on_attach = function()
    print "lua_ls is attaching!!!"
    -- vim.keymap("n", "gc", "<Nop>", {buffer = 0,   noremap = true, silent = true  })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gc", vim.lsp.buf.definition, { buffer = 0, nowait = true })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { buffer = 0 })
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
    vim.keymap.set("n", "<leader>K", vim.diagnostic.open_float, { buffer = 0 })
    vim.keymap.set("n", "gc", vim.lsp.buf.definition, { buffer = 0, nowait = true })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
    client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = capabilities,
}
vim.cmd [[autocmd BufWritePre *.ts lua vim.lsp.buf.format({timeout_ms = 7000})]]
vim.cmd [[autocmd BufWritePre *.tsx lua vim.lsp.buf.format({timeout_ms = 7000})]]
vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.format({timeout_ms = 7000})]]
vim.cmd [[autocmd BufWritePre *.jsx lua vim.lsp.buf.format()]]

lspconfig.clangd.setup {
  on_attach = function()
    print "clangd is attaching!!!"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gc", vim.lsp.buf.definition, { buffer = 0, nowait = true })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
  end,
  capabilities = capabilities,
}


lspconfig.terraformls.setup {
  on_attach = function()
    print "terraform-ls is attaching!!!"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gc", vim.lsp.buf.definition, { buffer = 0, nowait = true })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
  end,
  capabilities = capabilities,
}
vim.cmd [[autocmd BufWritePost *.tf lua vim.lsp.buf.format()]]

lspconfig.phpactor.setup {
  on_attach = function()
    print "phpactor is attaching!!!"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gc", vim.lsp.buf.definition, { buffer = 0, nowait = true })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
  end,
  capabilities = capabilities,
init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    }
}

require 'lspconfig'.apex_ls.setup {
  apex_jar_path                     = '/Users/jpalmeri/Downloads/apex-jorje-lsp.jar',
  apex_enable_semantic_errors       = false, -- Whether to allow Apex Language Server to surface semantic errors
  apex_enable_completion_statistics = false, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
  filetypes                         = { "apexcode", "apex", "trigger", "st", "cls" },
  on_attach                         = function()
    print "apex_ls is attaching!!!"
    -- vim.bo.filetype = 'java'
    -- vim.bo[1].filetype = 'java'
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gc", vim.lsp.buf.definition, { buffer = 0, nowait = true })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
  end,
  capabilities                      = capabilities,
}
-- vim.cmd [[autocmd BufWritePost *.trigger lua vim.lsp.buf.format()]]
-- lspconfig.apex_ls.setup {
--   apex_jar_path                     = '/Users/jpalmeri/Downloads/apex-jorje-lsp.jar',
--   -- apex_jar_path                     = vim.fn.expand('$HOME/Downloads/apex-jorje-lsp.jar'),
--   apex_enable_semantic_errors       = true, -- Whether to allow Apex Language Server to surface semantic errors
--   apex_enable_completion_statistics = false, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
--   filetype                          = { "apexcode", "apex", "trigger", "st", "cls" },
--   on_attach                         = function()
--     print "apex_ls is attaching!!!"
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
--     vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
--     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
--     vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { buffer = 0 })
--     vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
--     vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
--   end,
--   capabilities                      = capabilities,
-- }

lspconfig.bashls.setup {
  on_attach = function()
    print "bashls is attaching!!!"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gc", vim.lsp.buf.definition, { buffer = 0, nowait = true })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
  end,
  capabilities = capabilities,
}

lspconfig.tailwindcss.setup {
  on_attach = function()
    -- print "tailwindcss is attaching!!!"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "<leader>K", vim.diagnostic.open_float, { buffer = 0 })
    -- vim.keymap.set("n", "gc", vim.lsp.buf.definition, { buffer = 0, nowait = true })
    -- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    -- vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { buffer = 0 })
    -- vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    -- vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
    -- client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
  on_attach = function()
    print "rust_analyzer is attaching!!!"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "<leader>K", vim.diagnostic.open_float, { buffer = 0 })
    vim.keymap.set("n", "gc", vim.lsp.buf.definition, { buffer = 0, nowait = true })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = 0 })
    -- client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = capabilities,
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
  -- settings = {
  --   ['rust-analyzer'] = {
  --     diagnostics = {
  --       enable = false,
  --     }
  --   }
  -- }
}
vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.format()]]
