" plugins

"" vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'

"  text editing
Plugin 'dkarter/bullets.vim'
Plugin 'FooSoft/vim-argwrap'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'tmsvg/pear-tree'

"" visual plugins
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'simeji/winresizer'
Plugin 'Yggdroot/indentLine'

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

set encoding=utf8

set incsearch
set wildmenu

set splitright
set splitbelow

set autoindent
set smartindent

set ts=2 sw=2 sts=2

autocmd FileType python setlocal expandtab colorcolumn=80 ts=4 sw=4 sts=4
autocmd Filetype htmldjango setlocal ts=2 sw=2 expandtab
autocmd Filetype sh setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=4

set hlsearch
set ignorecase

" turn off search highlight
nnoremap ,<space> :noh<cr>

" no more ex mode type visual
nnoremap Q <Nop>

syntax enable
set cursorline
set number relativenumber

" yank to clipboard
set clipboard=unnamed

" persisent undo
set undofile
set undodir=~/.vim/undodir

" scrolling speed
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set background=dark
" let g:seoul256_background = 237  " 233 - 239 (darkest - lightest) - dark
" colorscheme seoul256
" colorscheme dracula
" colorscheme gruvbox
colorscheme hybrid

" Stay in visual mode when indenting. You will never have to run gv after
" " performing an indentation.
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
" plugin config

"" lightline
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'one',
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

"" fzf
set rtp+=~/.fzf
map <space> :Files /Users/adam/git/<CR>

"" turn on indent line
let g:indentLine_enabled = 1

" argmap
nnoremap <silent> ,a :ArgWrap<CR>

" win resize
"" window resizer
let g:winresizer_start_key=',t'
nnoremap <silent> ,x :WinResizerStartResize<CR>

" redraw
nnoremap <silent> ,r :redraw!<CR>

" autocomplete in markdown
let g:ycm_filetype_blacklist = {}

let g:ycm_min_num_of_chars_for_completion = 1

let g:pear_tree_ft_disabled = ['markdown']

" filetype specific

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

"" markdown
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

set foldlevelstart=20
set conceallevel=0
let g:vim_markdown_new_list_item_indent = 0

let python_highlight_all = 1

" Open markdown files with Chrome.
autocmd BufEnter *.md exe 'noremap <F5> :!start C:\Users\tomas\AppData\Local\Google\Chrome\Application\chrome.exe %:p<CR>'

" adg specific

"" macros
let @p="A\<cr>import pdb; pdb.set_trace()\<esc>"
let @m="A\<cr>if __name__ == '__main__':\<esc>\<cr>\<tab>"
let @s="i#!/usr/bin/env bash"

"" abbreviations
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
