local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', function()
  builtin.git_files({ show_untracked = true })
end, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>re', builtin.resume, {})

local actions = require('telescope.actions')
require('nvim-web-devicons').setup({
  override = {},
  default = true
})
require('telescope').setup {
  defaults = {
    -- path_display = { 'hidden' },
    path_display = { 'truncate' },
    mappings = {
      i = {
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<esc>"] = actions.close
      }
    },
    color_devicons = true,
    prompt_prefix = '🔍 ',
  },
  vimgrep_arguments = { "rg", "--column", "--ignore-case", "--hidden", "--multiline", "--vimgrep" },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6
    },
    vertical = {
      mirror = true,
      preview_cutoff = 0.4,
    },
    height = 0.94,
    width = 0.86,
  },
  pickers = {
    layout_strategy = "vertical",
    layout_config = {
      width = 0.5,
      height = 0.95,
      preview_cutoff = 0,
      anchor = "E"
    },
    initial_mode = "normal"
  },
  extensions = {
    coc = {
      theme = "ivy",
      prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    }
  }
}

require('telescope').load_extension('coc')
require('telescope').load_extension('fzf')
