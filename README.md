# bazuka5801 - nvim setup

![image](https://user-images.githubusercontent.com/11452353/213674661-8854b4e3-5fbd-4144-a61c-2bb737cae8d6.png)

# How to exit?

- `:q` or `<leader>q` or `ZQ`
- `:wq` or `ZZ`

# Vim helpers

- `ci` - change inside (ex. `ciw`, `ci{`) - remove and go insert mode
- [Visual] `J` and `K` move selected up/down
- `J` - move next line to current and keep cursor
- `F=` or `T=` - return to `=` symbol on line
- `f(` - go to near brace
- `df(` - remove to near brace
- `yt,` - copy symbols to `,`
- `vF=` - select to near `=`

- `A` - insert mode on end of the line
- `I` - insert mode on start of the line
- `o` - to make a new line
- `O` - to make a line above your cursor
- `:100` - go to 100 line
- `%` - go to close { or '

# Commands

- `<leader>q` - quit
- `<leader>w` - write

- `<leader>s` - vertical split
- `<C-f>` - switch tab cursor

- `<C-o>` - go back from ex. `gd`

- `>` - autoclose tag
- `<leader>ta` - toggle boolean (true/false)
- `<C-k>` - show keymaps

### Search

- `<leader>f` - files
- `<leader>g` - grep content
- `<leader>

### Bookmarks

- `mm` - bookmark
- `ma` - list bookmarks

### lsp

- `<leader>rn` - rename symbol
- `gd` - go to definition
- `gi` - go to implementation
- `<leader>ca` - code action
- `gr` - references
- `<leader>d` - find symbols

- `[d` and `]d` - go to next/prev diagnostic

# lsp vue (coc)

- `gd` - go to definition
- `gi` - go to implementation
- `gr` - show references
- `K` - show documentation
- `<leader>a`- show diagnostic
- `<leader>e` - show coc extensions
- `<leader>c` - show coc commands
- `<leader>o` - search symbols of current document
- `<C-.>` - quickfix
- `<C-,>` - code actions (cursor)
- `<C-m>` - code actions (file)

- _Refactoring_
- `<leader>rn` - rename
- `<C-s>` - select range

### Completion

- `<c-r>` - accept compltion

### Typescript

- `]a` and `[a` - swap argument
- `ga` - jump to next argument
- `<leader>o` - organize imports
- `<leader>a` - add missing imports

### Other

- `<c-\>` - open terminal
