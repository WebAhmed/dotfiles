" Special thanks to
" Jānis Miezītis : https://github.com/janjiss
" Ben Orenstein : https://github.com/r00k
" Daniel Miessler : https://github.com/danielmiessler
" A lot of my settings were copied or inspired by their's.

let mapleader = ' '
set nocompatible 
set encoding=utf-8
set history=50
set ruler

" For vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Dependency managment
Plugin 'gmarik/vundle'

" SnipMate and its dependencies:
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" React snippets:
Plugin 'justinj/vim-react-snippets'

" Jsx highligh and autocomplete
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Other sets of snippets (optional):
Plugin 'honza/vim-snippets'

" Good looking bottom :)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" NerdTree
Plugin 'scrooloose/nerdtree'

" Commenting and uncommenting stuff
Plugin 'tomtom/tcomment_vim'

" Beutiful solarized theme
Plugin 'altercation/vim-colors-solarized'

" Vim Ruby
Plugin 'vim-ruby/vim-ruby'

" Rails 
Plugin 'tpope/vim-rails.git'

" CoffeeScript syntax
Plugin 'kchmck/vim-coffee-script'

" Surround your code :)
Plugin 'tpope/vim-surround'

" Every one should have a pair (Autogenerate pairs for "{[( )
Plugin 'jiangmiao/auto-pairs'

" Tab completions
Plugin 'ervandew/supertab'

" Fuzzy finder for vim (CTRL+P)
Plugin 'kien/ctrlp.vim'

" Ruby Tests
Plugin 'skalnik/vim-vroom'

" Easy motion for easy motion
Plugin 'Lokaltog/vim-easymotion'

" Gist
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'danro/rename.vim'
Plugin 'nono/vim-handlebars'

" vim-tmux integeration
Plugin 'tmux-plugins/vim-tmux'

" vim-tmux-navigator
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()

" Buttons reconfigs and maps
imap jj  <ESC>
nmap <Leader>bi :w<cr>:source ~/.vimrc<cr>:PluginInstall<cr><C-h>:q<cr>
" check the :reg
nmap <Leader>re :reg<cr>
" Fix indentation
nmap <Leader>= ggVG=

" Saving and quitting
nmap <Leader>qq :q<cr>
nmap <Leader>ww :w<cr>
nmap <Leader>wq :wq<cr>

" Quicker in-file movement
nmap <Leader>j <C-d>
nmap <Leader>k <C-u>
nmap <Leader>f <C-f>
nmap <Leader>b <C-b>

" Quicker buffer movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Moving buffers around
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>H <C-w>H
nnoremap <Leader>L <C-w>L

" Buffer splitting shortcuts
nnoremap <leader>nw :new  
nnoremap <leader>vw :vnew  
nnoremap <leader>sp :split  
nnoremap <leader>vsp :vsplit  

" turn arrow keys off
inoremap  <up>     <nop>
inoremap  <down>   <nop>
inoremap  <left>   <nop>
inoremap  <right>  <nop>
noremap   <up>     <nop>
noremap   <down>   <nop>
noremap   <left>   <nop>
noremap   <right>  <nop>

" ruby hash syntax conversion
nnoremap <f12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>

" Increment numbers
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Vroom settings
map <Leader>c :call vroom#RunTestFile()<CR>
map <Leader>s :call vroom#RunNearestTest()<CR>
map <leader>t :A<CR> " \t to jump to test file
map <leader>r :r<cr> " \t to jump to related file
map <leader>E :Explore .<cr> " \E to open file explorer in root
map <leader>e :Explore<cr> " \e to open file explorer in current dir
let g:vroom_map_keys = 0
let g:vroom_use_dispatch = 1
let g:vroom_use_zeus = 1

" NerdTree settings
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" ESLint settings
let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0
let g:javascript_enable_domhtmlcss = 1

set autoindent " Auto indention should be on

" Ruby stuff:
" ================
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,markdown set ai sw=2 sts=2 et
augroup END
" ================

" Syntax highlighting and theme
let g:airline_theme='molokai'
let g:airline#extensions#bufferline#enabled = 1
let g:airline_powerline_fonts=1
syntax enable

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Lovely linenumbers
set nu
set relativenumber 

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set laststatus=2

" highlight the current line
set cursorline
" Highlight active column
" set cuc cul"

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" Capitalizations
if (&tildeop)
  nmap gcw guw~l
  nmap gcW guW~l
  nmap gciw guiw~l
  nmap gciW guiW~l
  nmap gcis guis~l
  nmap gc$ gu$~l
  nmap gcgc guu~l
  nmap gcc guu~l
  vmap gc gu~l
else
  nmap gcw guw~h
  nmap gcW guW~h
  nmap gciw guiw~h
  nmap gciW guiW~h
  nmap gcis guis~h
  nmap gc$ gu$~h
  nmap gcgc guu~h
  nmap gcc guu~h
  vmap gc gu~h
endif
" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif


