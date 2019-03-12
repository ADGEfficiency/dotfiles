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
Plugin 'junegunn/vim-easy-align'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kana/vim-textobj-user'
Plugin 'bps/vim-textobj-python'

"  themes
Plugin 'joshdick/onedark.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tomasr/molokai'
Plugin 'Yggdroot/duoduo'
Plugin 'jnurmine/Zenburn'
Plugin 'rakr/vim-one'
Plugin 'morhetz/gruvbox'
Plugin 'fenetikm/falcon'
Plugin 'cormacrelf/vim-colors-github'
Plugin 'ErichDonGubler/vim-sublime-monokai'
Plugin 'chriskempson/base16-vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'mattly/iterm-colors-pencil'
Plugin 'ajh17/spacegray.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set autoindent
set smartindent

set splitright

set hlsearch
set ignorecase
set smartcase


" visual setup
syntax enable
set cursorline
set number relativenumber   " row numbers
set guifont=Iosevka\ Nerd\ Font\ 13

" ONE
colorscheme one
set background=dark

"  SEOUL
" let g:seoul256_background = 237  " 233 - 239 (darkest - lightest) - dark
" colorscheme seoul256

"  set the background of the highlight menu
hi Pmenu ctermbg=gray guibg=gray
hi PmenuSel ctermbg=white ctermfg=black

" spell check formatting
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red
hi clear SpellRare
hi SpellRare cterm=underline ctermfg=red
hi clear SpellCap
hi SpellCap cterm=underline ctermfg=red
hi clear SpellLocal
hi SpellLocal cterm=underline ctermfg=red
hi clear ALEERROR
hi ALEError cterm=underline ctermfg=red
hi clear ALEWarning
hi ALEWarning cterm=underline ctermfg=red

set ts=4 sw=4 sts=4

autocmd FileType python setlocal expandtab colorcolumn=80
autocmd Filetype htmldjango setlocal ts=2 sw=2 expandtab
autocmd Filetype sh setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=4

autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

augroup markdown
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_nz
    autocmd FileType markdown setlocal noautoindent
    autocmd FileType markdown setlocal nosmartindent
    autocmd FileType markdown setlocal noexpandtab
    autocmd FileType markdown setlocal shiftwidth=4
    autocmd FileType markdown setlocal softtabstop=4
    autocmd FileType markdown setlocal tabstop=4
    set complete+=k

    autocmd Filetype markdown colorscheme sublimemonokai

    autocmd FileType markdown hi clear SpellBad
    autocmd FileType markdown hi SpellBad cterm=underline,bold ctermfg=red
    autocmd FileType markdown hi clear SpellRare
    autocmd FileType markdown hi SpellRare cterm=underline,bold ctermfg=red
    autocmd FileType markdown hi clear SpellCap
    autocmd FileType markdown hi SpellCap cterm=underline,bold ctermfg=red
    autocmd FileType markdown hi clear SpellLocal
    autocmd FileType markdown hi SpellLocal cterm=underline,bold ctermfg=red
    autocmd FileType markdown hi clear ALEERROR
    autocmd FileType markdown hi ALEError cterm=underline,bold ctermfg=red
    autocmd FileType markdown hi clear ALEWarning
    autocmd FileType markdown hi ALEWarning cterm=underline,bold ctermfg=red

augroup end

set foldmethod=syntax
set foldlevelstart=20
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_new_list_item_indent = 0

" scrolling speed
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" persisent undo
set undofile
set undodir=~/.vim/undodir

"  remap escape
imap jj <esc>

" macros
let @p="A\<cr>import pdb; pdb.set_trace()\<esc>"
let @m="A\<cr>if __name__ == '__main__':\<esc>\<cr>\<tab>"
let @l='i(https://github.com/ADGEfficiency/personal/blob/master/'
let @y='i[youtube](jjAi)'

" abbreviations
ab uncertanity uncertainty
ab uncertantity uncertainty
ab impementing implementing
ab reccomendations recommendations
ab recongizing recognizing
ab parameterizing parametrizing
ab parameterize parametrize
ab commmunication communication
ab specifc specific
ab gurantees guarantees
ab probabilities probabilities
ab horizion horizon
ab repititon repetition
ab contraditions contradictions
ab unprecented unprecedented
ab specalization specialization
ab recieved received
ab eaisly easily
ab detailled detailed
ab guranteed guaranteed

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

let python_highlight_all=1

"  NERD_tree
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

"  fzf
map <space> :Files /Users/adam/git/<CR>

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
let g:winresizer_start_key='<C-z>'

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" goyo
let g:goyo_width=140
let g:goyo_height=95
let g:goyo_linear=0
