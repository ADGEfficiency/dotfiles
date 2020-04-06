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
Plugin 'psliwka/vim-smoothie'
Plugin 'Valloric/YouCompleteMe'

"" text editing
Plugin 'w0rp/ale'
Plugin 'dkarter/bullets.vim'
Plugin 'tmsvg/pear-tree'
Plugin 'ron89/thesaurus_query.vim'
Plugin 'FooSoft/vim-argwrap'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-commentary'
Plugin 'plasticboy/vim-markdown'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'vim-python/python-syntax'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'pangloss/vim-javascript'

"" visual plugins
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'simeji/winresizer'
Plugin 'Yggdroot/indentLine'
Plugin 'arzg/vim-corvine'
Plugin 'airblade/vim-gitgutter'

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

call vundle#end()
filetype plugin indent on


" GENERAL

"" gf command working with unsaved buffer
set hidden

"" enable html tag matching
packadd! matchit

set encoding=utf8

"" show tabs
set list
set listchars=tab:>-

syntax enable
set cursorline
set number relativenumber

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
set conceallevel=0

set backspace=indent,eol,start

set ts=2 sw=2 sts=2


" REMAPS

let mapleader=","

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
let g:winresizer_start_key=',x'
nnoremap <silent> ,x :WinResizerStartResize<CR>

" thesaurus 
nnoremap <silent> ,t :ThesaurusQueryReplaceCurrentWord<CR>

"  no more errors on :W, :WQ, :Q
command W write
command Wq write | quit!
command Q quit


" visual
set background=dark
colorscheme dracula

"" must be after colo!
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


" plugin config

"" lightline
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'ayu_mirage',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'percent'],
      \              [ 'lineinfo'],
      \              [ 'cwd', 'filetype' ] ],
      \ },
      \ 'component': {
      \   'cwd': '%{getcwd()}',
      \   'lineinfo': '%3l:%-2v%<',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'fileformat': 'LightlineFileformat',
      \ },
      \ }

function! LightlineFileformat()
	  return winwidth(0) > 70 ? &fileformat : ''
	endfunction

"" fzf
set rtp+=~/.fzf
map <space> :Files /Users/adam/git/<CR>

"" indent line
let g:indentLine_enabled = 1

"" autocomplete in markdown
"" https://github.com/ycm-core/YouCompleteMe#options
let g:ycm_filetype_blacklist = {}
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 0

let g:ycm_max_num_candidates = 10
let g:ycm_max_num_identifier_candidates = 10
let g:ycm_auto_trigger = 1
let g:ycm_add_preview_to_completeopt = 1

let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1

let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

"" pear tree
""" needed to get markdown list stop working
let g:pear_tree_ft_disabled = ['markdown']

"" vim markdown
let g:vim_markdown_new_list_item_indent = 0

"" vim-javascript
let g:javascript_plugin_jsdoc = 1

"" python syntax
let g:python_highlight_all = 1


" filetype specific

autocmd FileType python setlocal expandtab colorcolumn=80 ts=4 sw=4 sts=4
autocmd Filetype htmldjango setlocal ts=2 sw=2 expandtab
autocmd Filetype sh setlocal ts=2 sw=2 expandtab
au BufRead,BufNewFile *.html set filetype=html
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2
autocmd Filetype html setlocal ts=2 sw=2 sts=2

"autocmd BufRead,BufNewFile *.py let python_highlight_all=1

augroup markdown
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_nz
    autocmd FileType markdown setlocal noautoindent
    autocmd FileType markdown setlocal nosmartindent
    autocmd FileType markdown setlocal noexpandtab
	autocmd FileType markdown let g:indentLine_enabled=0
    set complete+=k
augroup end

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab



" MACROS

let @p="A\<cr>import pdb; pdb.set_trace()\<esc>"
let @m="A\<cr>if __name__ == '__main__':\<esc>\<cr>\<tab>"
let @s="i#!/usr/bin/env bash"
let @n="A\import numpy as np\<cr>\import matplotlib.pyplot as plt\<cr>\import pandas as pd\<cr>\<esc>\<cr>\<tab>"


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


" MISC

" Return to last edit position when opening files (You want this!)
augroup return_to_last_edit_position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END

" DEV - note system (will probably throw away :)

" problem == only looks at match on file name (not folders as well)
command LI read !find $HOME/git/programming-resources -name "**vim**" | grep -v "png" | grep -v "jpg" | grep -v ".swp"

" all good :)
command LIN read !grep -Rl --include="*vim*" vim $HOME/git/programming-resources

function! s:MyFunc(myParam)
	echom a:myParam
	let l:incl=a:myParam
	read !grep -Rl --include="*vim*" l:incl $HOME/git/programming-resources
endfunction

command! -nargs=1 LINK call s:MyFunc(<f-args>)
