isLua = string.find(vim.fn.getcwd(), ".config/nvim")

if vim.g.neovide then
  require('neovide')
end

require('base')
require('maps')
require('plugins')
require('p-mason')
if isLua then
  require('p-lsp')
end
require('p-tree')
require('color')
require('text')
require('p-lualine')
require('p-barbar')
if not isLua then
  require('p-coc')
end
require('p-telescope')
require('p-bookmark')
require('p-lspkind')
if isLua then
  require('p-cmp')
end
require('p-null')
require('p-snip')
require('p-treesitter')
require('style')
require('other')
require('p-indent')
require('p-ufo')
require('p-npm')
require('p-hop')
