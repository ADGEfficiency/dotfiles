" ENCODING
set encoding=utf8
scriptencoding utf-8

" VUNDLE SETUP
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'airblade/vim-gitgutter'
Plugin 'nvie/vim-flake8.git'
Plugin 'tpope/vim-commentary'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'yggdroot/indentline'
Plugin 'simeji/winresizer'
Plugin 'nathanaelkane/vim-indent-guides'

"  themes
Plugin 'joshdick/onedark.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tomasr/molokai'
Plugin 'Yggdroot/duoduo'
Plugin 'jnurmine/Zenburn'
Plugin 'rakr/vim-one'
Plugin 'morhetz/gruvbox'
Plugin 'nightsense/carbonized'
Plugin 'fenetikm/falcon'
Plugin 'cormacrelf/vim-colors-github'
Plugin 'ErichDonGubler/vim-sublime-monokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" visual setup
syntax enable
set cursorline
set number relativenumber   " row numbers

set guifont=Iosevka\ Nerd\ Font\ 13

" theme
" set background=dark
" let g:solarized_termcolors=256
" colorscheme duoduo

colorscheme sublimemonokai

" underline spelling mistakes
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
hi SpellCap cterm=underline ctermfg=red
hi SpellRare cterm=underline ctermfg=red
hi SpellLocal cterm=underline ctermfg=red
hi ALEError cterm=underline ctermfg=red
hi ALEWarning cterm=underline ctermfg=red

" scrolling speed
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"  remap escape
imap jj <esc>

" macros
let @p='iimport pdb; pdb.set_trace()'
let @l='i(https://github.com/ADGEfficiency/personal/blob/master/'
let @y='i[youtube](jjAi)'

" abbreviations
ab uncertanity uncertainty
ab uncertantity uncertainty
ab impementing implementing
ab reccomendations recommendations

" start with folds open
set foldlevelstart=20

"  remember folds
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave *.* mkview
"   autocmd BufWinEnter *.* loadview
" augroup END

" config for lightline
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'percent'],
      \              [ 'lineinfo'],
      \              [ 'cwd', 'filetype' ] ],
      \ },
      \ 'component': {
      \   'cwd': 'cwd is %{getcwd()}'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

set autoindent
set splitright  "  split tabs to the right
set hlsearch

augroup python
    autocmd!
    autocmd FileType python setlocal expandtab
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal textwidth=80
    autocmd FileType python setlocal colorcolumn=80
    autocmd FileType python setlocal softtabstop=4
    autocmd FileType python setlocal tabstop=4
    autocmd FileType python setlocal autoindent
augroup end

autocmd Filetype htmldjango setlocal ts=2 sw=2 expandtab
autocmd Filetype sh setlocal ts=2 sw=2 expandtab

autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

augroup markdown
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_nz
    autocmd FileType markdown setlocal expandtab
    autocmd FileType markdown setlocal shiftwidth=4
    autocmd FileType markdown setlocal softtabstop=4
    autocmd FileType markdown setlocal tabstop=4
    set complete+=k
augroup end

"  markdown folding
let g:vim_markdown_folding_style_pythonic = 1

let python_highlight_all=1

"  plugin configs

"  NERD_tree
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

"  fzf
map <space> :Files<CR>

"  tagbar
nmap <F8> :TagbarToggle<CR>

"  pandoc
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0

"  you complete me
let g:ycm_filetype_blacklist = {}

" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" " block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" " inline math
syn match math '\$[^$].\{-}\$'

" actually highlight the region we defined as math
hi link math Statement

" remap the shortcut for window resizer
let g:winresizer_start_key='<C-a>'
