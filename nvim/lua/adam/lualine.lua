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
      'diff',
      {
        'diagnostics',
        symbols = {error = '', warn = '', info = '', hint = ''},
        always_visible = true,
        sections = { 'error', 'warn'},
        update_in_insert = true,
      },
    },
    lualine_c = {{
      'buffers',
      mode = 2,
      buffers_color = {
         active = { fg = "#50fa7b", bg = "#44475A" },
       },
    }},
    lualine_x = {},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  tabline = {},
  extensions = {}
}
