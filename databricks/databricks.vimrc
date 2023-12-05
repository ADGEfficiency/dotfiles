" GENERAL

syntax enable
set cursorline
set number
set norelativenumber

set completeopt=menu,preview
set expandtab

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

set signcolumn=yes


" REMAPS

cabbrev v vsp
cabbrev s sp
cabbrev f Files

"" turn off search highlight
nnoremap ,<space> :noh<cr>

"" no more ex mode type visual
nnoremap Q <Nop>

"" Stay in visual mode when indenting. You will never have to run gv after
"" performing an indentation.
vnoremap < <gv
vnoremap > >gv

" Move around splits with <C-[hjkl]> in normal mode
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" toggle paste
nnoremap <silent> ,p :set paste!<CR>

"  no more errors on :W, :WQ, :Q
command W write
command Wq write | quit!
command Q quit

" paste absolute file path
nnoremap <silent> ,r :r! echo %:p<CR>

"  buffers
nnoremap <C-n> :bnext<CR>:redraw<CR>
nnoremap <C-t> :bprevious<CR>:redraw<CR>
nnoremap ,k :ls<CR>:b<Space>

nnoremap ,j :Files .<CR>
nnoremap <A-Space> :Files .<CR>

:cnoremap qb bd


" VISUAL

colorscheme dracula

"" must be after colo!
hi clear SpellBad
hi SpellBad cterm=bold ctermfg=red
hi clear SpellRare
hi SpellRare cterm=bold ctermfg=red
hi clear SpellCap
hi SpellCap cterm=bold ctermfg=red
hi clear SpellLocal
hi SpellLocal cterm=bold ctermfg=red
hi clear ALEERROR
hi ALEError cterm=bold ctermfg=red
hi clear ALEWarning
hi ALEWarning cterm=bold ctermfg=red


" filetype specific

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

autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab conceallevel=0

au BufRead,BufNewFile *.web set filetype=Dockerfile

" MACROS

let @p="A\<cr>import pdb; pdb.set_trace()\<esc>"
let @p="A\<cr>breakpoint()\<esc>"
let @m="A\<cr>if __name__ == '__main__':\<esc>\<cr>\<tab>"
let @s="i#!/usr/bin/env bash"
let @n="A\import numpy as np\<cr>\import matplotlib.pyplot as plt\<cr>\import pandas as pd\<cr>\from pathlib import Path\<cr>\<esc>\<cr>\<tab>"
let @c="V<<<<<jmak:.m90kbkb0`ak"


" ABBREVIATIONS

ab uncertanity uncertainty
ab uncertantity uncertainty
ab implementing implementing
ab recommendations recommendations
ab recongizing recognizing
ab parameterizing parametrizing
ab parameterize parametrize
ab communication communication
ab specific specific
ab probabilities probabilities
ab horizion horizon
ab repititon repetition
ab contraditions contradictions
ab unprecented unprecedented
ab specalization specialization
ab received received
ab receives receives
ab eaisly easily
ab detailed detailed
ab guarantee guarantee
ab guaranteed guaranteed
ab guarantees guarantees
ab convenient convenient
ab convienet convenient
ab graident gradient
ab different different
ab determinsitc deterministic
ab recommended recommended
ab artificial artificial
ab recongition recognition
ab easier easier
ab typicial typical
ab certantity certainty
ab among among
ab oppourtunity opportunity
ab strategy strategy
ab strategies strategies
ab intitution intuition
ab information information
ab timestup timestep
ab tow two
ab inline in-line
ab period period


" MISC

" Return to last edit position when opening files
augroup return_to_last_edit_position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END
