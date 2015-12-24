" Vundle

set nocompatible	" not compatible with the old-fashion vi mode"
filetype off " required!

" Setting up vundle - the vim plugin bundler

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle"
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
" required!
  Plugin 'gmarik/vundle'

" My Plugins here:
"
" original repos on github

  Plugin 'plasticboy/vim-markdown'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'Townk/vim-autoclose'
  Plugin 'kien/ctrlp.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'majutsushi/tagbar'
  Plugin 'tomtom/tcomment_vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'honza/vim-snippets'
  Plugin 'garbas/vim-snipmate'
  Plugin 'Yggdroot/indentLine'

  Plugin 'opengl.vim'

  Plugin 'JulesWang/css.vim'
  "Plugin 'cakebaker/scss-syntax.vim'

  Plugin 'bling/vim-airline'
  "Plugin 'kchmck/vim-coffee-script'

  Plugin 'moll/vim-node'
  "Plugin 'hallettj/jslint.vim'

  Plugin 'elzr/vim-json'
  Plugin 'tpope/vim-surround'

" General

filetype plugin indent on " enable filetype-specific plugins 
filetype plugin on        " enable Loading the plugin files for specific file types
filetype indent on	  " enable Loading the indent for specific file types
set history=50 		  " keep 50 Lines of command Line history
set number 		  " enable Line numbers
set autoindent		  " enable autoindent
set expandtab		  " use space instead of tab
set tabstop=2		  " insert 2 spaces for a tab
set shiftwidth=2	  " the number of space characters inserted for indentation
syntax on	  " enable syntax hightlighting
colorscheme Tomorrow-Night-Eighties
set autoread		  " auto read when file is change from outside
set noswapfile    " don't produce .swp 


if has("gui_running")     " GUI color and font settings
  set t_Co=256            " 256 color mode
end

set clipboard=unnamed     " yank to the system register (*) by default
set showmode		  " Show current mode
set backspace=2		  " make backspace work Like most other apps


" open NerdTree with <F5> 
map <F5> :NERDTreeToggle<CR>

" encoding settings
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" status Line
set laststatus=2

" vim code Fold

" --- vim-gitgutter
let g:gitgutter_enabled = 1
highlight clear SignCloumn " For the same appearance as your Line number column

" --- tagbar
nmap <F1> :TagbarToggle<CR>

" ---ctrlp
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_show_hidden = 1

" ---markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldevel=1
let g:vim_markdown_no_default_key_mapping=1

" <one click complier c++>
" F9 save-complier-run
map <F9> :call CompileRunGpp()<CR>

func! CompileRunGpp()
  exec "w"
  exec "!g++ % -o %<"
  exec "! ./%<"
endfunc

" --- indentLine
let g:indentLine_color_term = 239


" ---set File type tab space

autocmd FileType java set tabstop=4|set shiftwidth=4|set expandtab

" ---set json-vim

let g:vim_json_syntax_conceal = 0

" ---set search highlight

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" ---set quitfix map
map <C-j> <ESC>:cnext<CR>
map <C-k> <ESC>:cprev<CR>

" jslint
let g:JSLintHighlightErrorLine = 0
