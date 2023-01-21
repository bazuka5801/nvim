vim.g.mapleader = ' '
local keymap = vim.keymap

keymap.set('n', '<leader>q', '<cmd>q<cr>')
keymap.set('n', '<leader>w', '<cmd>w<cr>')

keymap.set('n', '<c-a>', 'gg<S-v>g')

-- vertical split tab
keymap.set('n', '<leader>s', ':vsplit<Return><C-w>w', { silent = true })

-- switch tab cursor
keymap.set('n', '<c-f>', '<C-w>w')

keymap.set('n', 'H', '^')
keymap.set('n', 'L', '$')

keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })

keymap.set('n', 'J', "mzJ`z")
keymap.set('n', '<C-d>', "<C-d>zz")
keymap.set('n', '<C-u>', "<C-u>zz")
keymap.set('x', '<leader>p', "\"_dP")

keymap.set('n', '<leader>y', "\"+y")
keymap.set('v', '<leader>y', "\"+y")
keymap.set('n', '<leader>Y', "\"+Y")

keymap.set('n', '<leader>d', "\"_d")
keymap.set('v', '<leader>d', "\"_d")

keymap.set('i', '<C-c>', "<Esc>")
keymap.set('n', 'Q', '<nop>')
