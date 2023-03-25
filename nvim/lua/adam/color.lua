vim.cmd([[
  try
    colorscheme dracula
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])

-- vim.cmd[[
--   let g:everforest_better_performance = 1
--   let g:everforest_background = 'hard'
--   set background=dark
--   colorscheme everforest
-- ]]
