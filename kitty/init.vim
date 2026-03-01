set number
set relativenumber
set mouse=a
set clipboard+=unnamedplus
set termguicolors
set background=dark
set laststatus=0
set scrolloff=8
set noswapfile
set ignorecase

map <silent> q :qa!<CR>

" Brief highlight on yanked text
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" Start at the bottom of the scrollback buffer
augroup start_at_bottom
    autocmd!
    autocmd VimEnter * normal G
augroup END
