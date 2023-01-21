require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    'sumneko_lua',
    'tsserver',
    --[[     'volar' ]]
  },

  automatic_installation = true,
})
