" PLUGINS

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" package manager
Plugin 'VundleVim/Vundle.vim'

"" core
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

"" text editing
Plugin 'dense-analysis/ale'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'dkarter/bullets.vim'
Plugin 'tmsvg/pear-tree'
Plugin 'ron89/thesaurus_query.vim'
Plugin 'FooSoft/vim-argwrap'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-commentary'
Plugin 'plasticboy/vim-markdown'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'pangloss/vim-javascript'
Plugin 'jiangmiao/auto-pairs'
Plugin 'psf/black'

"" visual plugins
Plugin 'itchyny/lightline.vim'
Plugin 'mengelbrecht/lightline-bufferline'
Plugin 'simeji/winresizer'
Plugin 'Yggdroot/indentLine'
Plugin 'arzg/vim-corvine'
Plugin 'airblade/vim-gitgutter'
Plugin 'pedrohdz/vim-yaml-folds'

"" themes
Plugin 'junegunn/seoul256.vim'
Plugin 'rakr/vim-one'
Plugin 'Yggdroot/duoduo'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'dracula/vim'
Plugin 'cseelus/vim-colors-tone'
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'arcticicestudio/nord-vim'
Plugin 'sickill/vim-monokai'

call vundle#end()
filetype plugin indent on


" GENERAL

syntax enable
set cursorline
set number
set norelativenumber

"" gf command working with unsaved buffer
set hidden

"" enable html tag matching
packadd! matchit

set encoding=utf8

"" show tabs
set list
set listchars=tab:>-

" yank to clipboard
set clipboard=unnamed

" persisent undo
set undofile
set undodir=~/.vim/undodir

set incsearch
set hlsearch
set ignorecase

set wildmenu
set lazyredraw

set splitright
set splitbelow

set autoindent
set smartindent

set foldlevelstart=20

set backspace=indent,eol,start

set ts=2 sw=2 sts=2

"" ignore paths
set wildignore+=*.egg-info/**

set mouse=a


" REMAPS
cabbrev v vsp
cabbrev s sp

"" scrolling speed
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"" turn off search highlight
nnoremap ,<space> :noh<cr>

"" no more ex mode type visual
nnoremap Q <Nop>

"" Stay in visual mode when indenting. You will never have to run gv after
"" performing an indentation.
vnoremap < <gv
vnoremap > >gv

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Move around splits with <C-[hjkl]> in normal mode
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" argmap
nnoremap <silent> ,a :ArgWrap<CR>

" toggle paste
nnoremap <silent> ,p :set paste!<CR>

" win resize
let g:winresizer_enable = 1
nnoremap <silent> ,x :WinResizerStartResize<CR>

" thesaurus
nnoremap <silent> ,t :ThesaurusQueryReplaceCurrentWord<CR>

"  no more errors on :W, :WQ, :Q
command W write
command Wq write | quit!
command Q quit

"  buffers
:nnoremap <C-n> :bnext<CR>:redraw<CR>
:nnoremap <C-t> :bprevious<CR>:redraw<CR>

" leader to ,
let mapleader = ","
let g:mapleader = ","

" paste absolute file path
nnoremap <silent> ,r :r! echo %:p<CR>


" visual
set background=dark
colorscheme dracula

"" must be after colo!
"" highlight
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red
hi clear SpellRare
hi SpellRare cterm=underline,bold ctermfg=red
hi clear SpellCap
hi SpellCap cterm=underline,bold ctermfg=red
hi clear SpellLocal
hi SpellLocal cterm=underline,bold ctermfg=red
hi clear ALEERROR
hi ALEError cterm=underline,bold ctermfg=red
hi clear ALEWarning
hi ALEWarning cterm=underline,bold ctermfg=red


" plugin configs

"" lightline
set laststatus=2
set noshowmode

" \   'right': [ ['lineinfo'], [ 'percent' ]],
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'modified', 'buffers' ] ],
      \   'right': [ ],
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ }

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[Nameless]'
let g:lightline#bufferline#enable_nerdfont = 1


"" fzf
set rtp+=~/.fzf
map <space> :Files $HOME<CR>
let g:fzf_preview_window = 'right:70%:hidden'
let g:fzf_height = '30%'

"" indent line
set conceallevel=1
let g:indentLine_enabled = 1
let g:indentLine_conceallevel=1
let g:indentLine_color_term = 239

"" coc
let g:coc_global_extensions = ['coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-yaml', 'coc-jedi']

" use tab for coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" https://www.reddit.com/r/neovim/comments/ejznuz/what_do_your_coc_settings_look_like/
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=no
endif

"" autocomplete in markdown
"" https://github.com/ycm-core/YouCompleteMe#options
let g:ycm_filetype_blacklist = {
      \ 'markdown': 1,
\}

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

set completeopt=menu,preview

"" pear tree
""" needed to get markdown list stop working
let g:pear_tree_ft_disabled = ['markdown']

"" vim markdown
let g:vim_markdown_new_list_item_indent = 0

"" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_chain_indent = 1

"" python syntax
let g:python_highlight_all = 1


" filetype specific

set expandtab

autocmd FileType python setlocal expandtab colorcolumn=100 ts=4 sw=4 sts=4
autocmd Filetype htmldjango setlocal ts=2 sw=2 expandtab
autocmd Filetype sh setlocal ts=2 sw=2 expandtab
au BufRead,BufNewFile *.html set filetype=html
autocmd Filetype javascript setlocal expandtab ts=2 sw=2 sts=2 smarttab cindent
autocmd Filetype html setlocal ts=2 sw=2 sts=2

augroup markdown
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_nz
    autocmd FileType markdown setlocal noautoindent
    autocmd FileType markdown setlocal nosmartindent
    autocmd FileType markdown setlocal expandtab
	  autocmd FileType markdown let g:indentLine_enabled=0
	  autocmd FileType markdown setlocal conceallevel=0
    set complete+=k
augroup end

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab



" MACROS

let @p="A\<cr>import pdb; pdb.set_trace()\<esc>"
let @p="A\<cr>breakpoint()\<esc>"
let @m="A\<cr>if __name__ == '__main__':\<esc>\<cr>\<tab>"
let @s="i#!/usr/bin/env bash"
let @n="A\import numpy as np\<cr>\import matplotlib.pyplot as plt\<cr>\import pandas as pd\<cr>\<esc>\<cr>\<tab>"


" SHORTCUTS

"  run file
map <F5> :!python %:p <enter>
" run block
map <F9> :'<,'>w !python <enter>

map <F6> :1,$d <enter>
map <F7> :%y+ <enter>
map <F8> :e ~/dotfiles/.vimrc <enter>

" run file interactive
" map <F6> :!ipython -i %:p <enter>
" "run line
" map <F7> :'.w !python <enter>

"map <F9> :e ~/dotfiles/.zshrc <enter>
"map <F10> :e ~/dotfiles/.aliases <enter>
"noremap <F11> <Esc>:syntax sync fromstart<CR>
"map <F12> :e ~/personal/lists/cheat_sheet.md <enter>

:cnoremap qb bd

" ABBREVIATIONS

ab uncertanity uncertainty
ab uncertantity uncertainty
ab impementing implementing
ab reccomendations recommendations
ab recongizing recognizing
ab parameterizing parametrizing
ab parameterize parametrize
ab commmunication communication
ab specifc specific
ab probabilities probabilities
ab horizion horizon
ab repititon repetition
ab contraditions contradictions
ab unprecented unprecedented
ab specalization specialization
ab recieved received
ab recieves receives
ab eaisly easily
ab detailled detailed
ab gurantee guarantee
ab guranteed guaranteed
ab gurantees guarantees
ab convienent convenient
ab convienet convenient
ab graident gradient
ab differnet different
ab determinsitc deterministic
ab reccomended recommended
ab artifical artificial
ab recongition recognition
ab eaiser easier
ab typicial typical
ab certantity certainty
ab amoung among
ab oppourtunity opportunity
ab stragety strategy
ab strageties strategies
ab intitution intuition
ab infomation information
ab timestup timestep
ab tow two
ab inline in-line

" MISC

" Return to last edit position when opening files (You want this!)
augroup return_to_last_edit_position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END


" ale
let g:ale_disable_lsp = 1
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 0

" black
autocmd BufWritePost *.py silent! execute ':Black'
