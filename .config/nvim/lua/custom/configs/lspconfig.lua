local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

capabilities.offsetEncoding = { "utf-16" }

-- Python
vim.lsp.config.pyright = {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
}
vim.lsp.enable('pyright')

vim.lsp.config.ruff = {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
}
vim.lsp.enable('ruff')

