set nocompatible

" - Store vim files (e.g. swp) here, but you have to create this dir.
set directory^=$HOME/.vim/tmp//

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'w0rp/ale'
Plug 'tpope/vim-surround'

" -- Javascript Syntax Highlighting
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'styled-components/vim-styled-components'

" -- Typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'heavenshell/vim-jsdoc'

call plug#end()

" -- Editor Settings -------------------------------------------------
syntax enable
set background=dark
colorscheme solarized
set number

" Make backspace behave in a sane manner.
set backspace=indent,eol,start
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Easy save in edit mode
inoremap <F1> <c-o>:w<cr>

" -- Keybindings -----------------------------------------------------
let mapleader = "\<Space>"

nmap <leader>vr :sp $MYVIMRC<CR>
nmap <leader>hr :vsp $MYVIMRC<CR>
nmap <leader>so :source $MYVIMRC<CR>
nmap <leader>l :set list!<CR> " toggle whitespace chars
nmap <leader>n :set rnu!<CR> " toggle relative line numbers

" Map ctrl+hjkl to pane switching
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Spellcheck
nmap <Leader>s :setlocal spell! spelllang=en_gb<CR>

" -- Ale -------------------------------------------------------------

" Make Ale use Airline
let g:airline#extensions#ale#enabled = 1

" Use eslint only for javascript
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let b:ale_fix_on_save = 1

" -- Automatic reloading of .vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
