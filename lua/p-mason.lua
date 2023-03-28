require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    'lua_ls',
    'vls',
    'volar'
  },
  automatic_installation = true,
})
