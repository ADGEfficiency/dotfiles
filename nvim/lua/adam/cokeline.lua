local get_hex = require('cokeline/utils').get_hex

local components = {
  space = {
    text = '  ',
    truncation = { priority = 1 }
  },
}

require('cokeline').setup({
  buffers = {
    new_buffers_position = 'last'
  },
  default_hl = {
    fg = function(buffer)
      if buffer.is_focused then return get_hex('ColorColumn', 'fg') end
      return get_hex('StatusLine', 'fg')
    end,
    bg = "#1F2028"
  },

  components = {
    components.space,
    {
      text = function(buffer) return buffer.number .. '  ' .. buffer.filename end,
      style = function(buffer)
        return (buffer.is_focused and 'bold')
            or nil
      end,
    },
    components.space,
    {
      text = function(buffer)
        if buffer.is_modified then
          return ''
        else 
          return ''
        end
      end,
    },
    components.space,
  },
})
