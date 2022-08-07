local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  print "nvim-lsp-installer not found"
  return
else
  print "nvim-lsp-installer found, continuing..."
end

lsp_installer.setup()
