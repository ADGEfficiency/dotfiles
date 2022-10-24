local get_hex = require('cokeline/utils').get_hex;

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end }},
    lualine_b = {
      {'branch', icon = ''},
    },
    lualine_c = {
      {'filename', path = 3, symbols = {
        modified = ' ',
        readonly = ' ',
        shorting_target = 4
      }}
    },
    lualine_x = {},
    lualine_y = {
      {
        'diff',
        colored = false,
        symbols = {added = ' ', modified = ' ', removed = ' '},
      },
      {
        'diagnostics',
        colored = false,
        symbols = {error = ' ', warn = ' ', info = '', hint = ''},
        always_visible = true,
        sections = { 'error', 'warn'},
        update_in_insert = true,
      },
    },
    lualine_z = {'progress', 'location'}
  },
  tabline = {},
  extensions = {'fzf'}
}
