vim.api.nvim_exec([[
augroup markdown
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_nz spellfile=~/dotfiles/nvim/spell/en.utf-8.add
    autocmd FileType markdown setlocal noautoindent
    autocmd FileType markdown setlocal nosmartindent
    autocmd FileType markdown setlocal expandtab
    autocmd FileType markdown let g:indentLine_enabled=0
    autocmd FileType markdown setlocal conceallevel=0
    autocmd FileType markdown syntax keyword Todo TODO DONE
    set complete+=k
augroup end
]], false)
