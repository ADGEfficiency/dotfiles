require('lualine').setup {
  options = {
    theme = 'nightfly',
    icons_enabled = true,
    section_separators = { left = ' ', right = ' '},
    component_separators = { left = ' ', right = ' '},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end }},
    lualine_b = {
      {
        'diagnostics',
        colored = true,
        symbols = {error = ' ', warn = ' ', info = '', hint = ''},
        always_visible = true,
        sections = { 'error', 'warn'},
        update_in_insert = true,
      },
      {
        'diff',
        colored = true,
        symbols = {added = ' ', modified = ' ', removed = ' '},
      },
    },
    lualine_c = {
      {
        'branch',
        colored = true,
        icon = ''
      },
      {
        'filename',
        colored = true,
        path = 3,
        symbols = {modified = ' ', readonly = ' ', shorting_target = 4}
      }
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'progress', 'location'}
  },
  tabline = {},
  extensions = {'fzf'}
}
