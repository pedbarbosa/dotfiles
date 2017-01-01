" Plugins
filetype off " required
call plug#begin('~/.vim/plugged')
Plug 'davidhalter/jedi-vim', { 'for': 'python'}
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-unimpaired'
Plug 'ekalinin/Dockerfile.vim'
Plug 'airblade/vim-rooter'
Plug 'kien/ctrlp.vim'
Plug 'rodjek/vim-puppet'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

" Whitespace
set tabstop=4     " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4  " number of spaces to move with <</>>
set expandtab     " tabs are spaces
set smarttab      " make <tab> insert indents correctly based on vim settings
set list lcs=tab:\|\

" Colours
set background=dark
colorscheme jellybeans

" UI
set nocompatible   " Use Vim defaults instead of 100% vi compatibility
set history=50     " keep 50 lines of command line history
set number         " show line numbers
set relativenumber " enable relative line numbers
set cursorline     " highlight current line
set showmatch      " Show matching brackets.
set ruler          " show the cursor position all the time
set modelines=1     " allow per-file vim configs
set lazyredraw     " redraw when needed. speeds up macros
set backspace=indent,eol,start     " more powerful backspacing
filetype plugin indent on

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Jump to last position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Syntax
syntax on
" Recognize exact file names as file types
au BufRead,BufNewFile {Gemfile,Vagrantfile,Berksfile} set ft=ruby
au BufRead,BufNewFile *.sls set ft=yaml
let g:syntastic_enable_perl_checker = 1
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_ruby_checkers=['jruby']
let g:syntastic_yaml_checkers=['yamlxs']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_zsh_checkers=['zsh']
let g:syntastic_sh_checkers=['shellcheck']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_puppet_checkers=['puppet']
let g:syntastic_python_flake8_args = "--max-line-length=500"

" Searching
set incsearch  " search as characters are entered
set hlsearch   " highlight searches
set ignorecase " Do case insensitive matching
set smartcase  " Do smart case matching

" Folding
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nexted folds max
nnoremap <space> za
set foldmethod=indent " default to indent folding

" Keyboard bindings
nmap <Esc>b <S-Left>
nmap <Esc>f <S-Right>
nmap <C-a> <Home>
nmap <C-e> <End>

" Per-plugin configs
" NERDTree
nmap <F8> :NERDTreeToggle<CR>
nmap <s-F8> :NERDTreeFind<CR>

" Airline
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

" Tagbar
let g:tagbar_autoclose = 1
let g:tagbar_type_puppet = {
    \ 'ctagstype': 'puppet',
    \ 'kinds': [
        \'c:class',
        \'s:site',
        \'n:node',
        \'d:definition'
      \]
    \}

" Tab control keys
nmap <F9> :TagbarToggle<CR>
