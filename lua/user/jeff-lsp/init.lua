local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print "lspconfig not found"
  return
else
  print "lspnconfig found, continuing..."
end

require("user.jeff-lsp.lsp-installer")
