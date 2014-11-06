" Vundle

set nocompatible	" not compatible with the old-fashion vi mode"
filetype off		" required!

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
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github

  Bundle 'plasticboy/vim-markdown'
  Bundle 'Lokaltog/vim-easymotion'
  Bundle 'airblade/vim-gitgutter'
  Bundle "MarcWeber/vim-addon-mw-utils"
  Bundle "tomtom/tlib_vim"
  Bundle 'Townk/vim-autoclose'
  Bundle 'kien/ctrlp.vim'
  Bundle 'scrooloose/nerdtree'
  Bundle 'majutsushi/tagbar'
  Bundle 'tomtom/tcomment_vim'
  Bundle 'tpope/vim-fugitive'
  Bundle 'honza/vim-snippets'
  Bundle 'garbas/vim-snipmate'
  Bundle 'L9'
  Bundle 'Yggdroot/indentLine'

  Bundle 'opengl.vim'

  Bundle 'JulesWang/css.vim'
  Bundle 'cakebaker/scss-syntax.vim'

  Bundle 'bling/vim-airline'

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
syntax on		  " enable syntax hightlighting
colors Tomorrow-Night-Bright " vim color scheme
set autoread		  " auto read when file is change from outside

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


