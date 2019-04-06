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
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'Vimjas/vim-python-pep8-indent'

"" visual plugins
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'simeji/winresizer'
Plugin 'Yggdroot/indentLine'

"" themes
Plugin 'junegunn/seoul256.vim'
Plugin 'rakr/vim-one'
Plugin 'Yggdroot/duoduo'

call vundle#end()
filetype plugin indent on

set encoding=utf8

set splitright
set splitbelow

set autoindent
set smartindent

set ts=4 sw=4 sts=4

autocmd FileType python setlocal expandtab colorcolumn=80
autocmd Filetype htmldjango setlocal ts=2 sw=2 expandtab
autocmd Filetype sh setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=4

set hlsearch
set ignorecase

syntax enable
set cursorline
set number relativenumber

" persisent undo
set undofile
set undodir=~/.vim/undodir

" scrolling speed
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set background=dark
let g:seoul256_background = 237  " 233 - 239 (darkest - lightest) - dark
colorscheme seoul256


" plugin config

"" lightline
set laststatus=2
set noshowmode

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

"" fzf
set rtp+=~/.fzf
map <space> :Files /Users/adam/git/<CR>

"" window resizer
let g:winresizer_start_key='<C-x>'

"" turn on indent line
let g:indentLine_enabled = 1

" filetype specific

"" markdown

augroup markdown
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_nz
    autocmd FileType markdown setlocal noautoindent
    autocmd FileType markdown setlocal nosmartindent
    autocmd FileType markdown setlocal noexpandtab
    set complete+=k

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

set foldlevelstart=20
set conceallevel=0
let g:vim_markdown_new_list_item_indent = 0

" adg specific

"" macros
let @p="A\<cr>import pdb; pdb.set_trace()\<esc>"
let @m="A\<cr>if __name__ == '__main__':\<esc>\<cr>\<tab>"

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

