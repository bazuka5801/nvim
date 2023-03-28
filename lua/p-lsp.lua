local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.lsp.set_log_level("debug")
local on_attach = function(_, bufnr, isTsserver)
  -- local function buf_set_option(...)
  --   vim.api.nvim_buf_set_option(bufnr, ...)
  --end

  -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', bufopts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<Shift-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', bufopts)
  vim.keymap.set('n', '<leader>d', '<cmd>Telescope lsp_document_symbols<cr>', bufopts)

  -- format on save
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
    buffer = bufnr,
    callback = function()
      if isTsserver == true then
        require('typescript').actions.removeUnused({ sync = true })
      end
      vim.lsp.buf.format()
    end
  })
end

-- Set up lspconfig.
local normal_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(normal_capabilities)

local lsp_config = {
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)
  end
}

local util = require 'lspconfig.util'
local function get_typescript_server_path(root_dir)
  local global_ts = '/Users/max/.config/yarn/global/node_modules/typescript/lib'
  local found_ts = ''
  local function check_dir(path)
    found_ts = util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end


require('mason-lspconfig').setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup(lsp_config)
  end,
  lua_ls = function()
    require('lspconfig').lua_ls.setup(vim.tbl_extend('force', lsp_config, {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }))
  end,
  -- tsserver = function()
  --   require('typescript').setup({
  --     server = vim.tbl_extend('force', lsp_config, {
  --       on_attach = function(_, bufnr)
  --         on_attach(_, bufnr, true)
  --       end,
  --       init_options = {
  --         preferences = {
  --           importModuleSpecifierPreference = 'project=relative',
  --           jsxAttributeCompletionStyle = 'none'
  --         }
  --       }
  --     })
  --   })
  -- end,
  -- cssls = function()
  --   require('lspconfig').cssls.setup(vim.tbl_extend('force', lsp_config, {
  --     filetypes = { 'vue', 'html', 'css', 'scss' }
  --   }))
  -- end,
  volar = function()
    --   require 'lspconfig'.volar.setup(vim.tbl_extend('force', lsp_config, {
    --     filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
    --     on_new_config = function(new_config, new_root_dir)
    --       new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
    --     end,
    --     root_dir = require("lspconfig").util.root_pattern("package.json", "werf.yaml"),
    --     init_options = {
    --
    --     }
    --   }))
    -- end
    require('lspconfig').volar.setup(vim.tbl_extend('force', lsp_config, {
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
      on_new_config = function(new_config, new_root_dir)
        new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
      end,
      init_options = {
        languageFeatures = {
          references = true,
          definition = true,
          typeDefinition = true,
          callHierarchy = true,
          hover = true,
          rename = true,
          signatureHelp = true,
          codeAction = true,
          completion = {
            defaultTagNameCase = "both",
            defaultAttrNameCase = "kebabCase",
          },
          schemaRequestService = true,
          documentHighlight = true,
          codeLens = true,
          semanticTokens = true,
          diagnostics = true,
        },
        documentFeatures = {
          selectionRange = true,
          foldingRange = true,
          linkedEditingRange = true,
          documentSymbol = true,
          documentColor = true,
        },
      },
      settings = {
        volar = {
          codeLens = {
            references = true,
            pugTools = true,
            scriptSetupTools = true,
          },
          vueserver = { fullCompletionList = true }
        },
      },
      root_dir = require("lspconfig").util.root_pattern("werf.yaml"),
    }))
  end
})
