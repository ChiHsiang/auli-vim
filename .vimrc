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
  Plugin 'majutsushi/tagbar'
  "Plugin 'tomtom/tcomment_vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'honza/vim-snippets'
  Plugin 'garbas/vim-snipmate'
  Plugin 'Yggdroot/indentLine'

  Plugin 'opengl.vim'

  Plugin 'JulesWang/css.vim'

  Plugin 'bling/vim-airline'

  Plugin 'moll/vim-node'

  Plugin 'elzr/vim-json'
  Plugin 'tpope/vim-surround'

  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'terryma/vim-expand-region'
  Plugin 'junegunn/vim-easy-align'

  Plugin 'hdima/python-syntax'

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
set cursorline
set showmatch " Auto pair find brackets

" encoding settings
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" status Line
set laststatus=2

" set ctags path
set tags=$HOME/tags

" vim code Fold
let mapleader = ","
let g:ctrlp_map = '<Leader>.'

" --- vim-gitgutter
let g:gitgutter_enabled = 1
highlight clear SignCloumn " For the same appearance as your Line number column

" --tarbar
nmap \\ :TagbarToggle<CR>

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
autocmd FileType c set tabstop=4|set shiftwidth=4|set expandtab

" ---set json-vim

let g:vim_json_syntax_conceal = 0

" ---set search highlight

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" ---set quitfix map
nnoremap <Leader>cn :cnext<CR>
nnoremap <Leader>cp :cprev<CR>
nnoremap <Leader>cw :copen<CR>
nnoremap <Leader>cc :cclose<CR>
nnoremap <Leader>cl :call setqflist([])<CR>

" ---set easymontion ex: nmap s <Plug>(easymotion-s)
map  / <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  m <Plug>(easymotion-prev)
nmap s <Plug>(easymotion-s2)

" ---set youcompleteme

"let g:ycm_key_list_select_completion = ['<Down>', '<C-N>']

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" -- set person mapping use mac
inoremap jk <ESC>
vnoremap jk <ESC>
nnoremap <C-a> ggVG
nnoremap <C-s> :wq<CR> :echo "Saved"<CR>

" -- set buffer mapping
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprev<CR>
nnoremap <Leader>bl :buffers<CR>

" -- set ctags go to define
nnoremap gd <C-]>
"nnoremap gd :execute "vertical ptag " . expand("<cword>")<CR>

" ---nerdTree in Explorer mappping
let g:netrw_liststyle=3  
nnoremap <Leader>nn :Explore<CR>
nnoremap <Leader>nr :Rexplore<CR>
nnoremap <Leader>nh :Hexplore<CR>
nnoremap <Leader>nv :Vexplore<CR>
nnoremap <Leader>nt :Texplore<CR>
nnoremap <Leader>w <c-w><c-w>
nnoremap <C-]> gt
nnoremap <C-[> gT
nnoremap <Leader>d :Lexplore<CR> 

" ---set window size
noremap <C-j> :resize +5<CR>
noremap <C-k> :resize -5<CR>
noremap <C-h> :vertical resize -5<CR>
noremap <C-l> :vertical resize +5<CR>

" ---quit and save file
nmap <Leader>s :w!<CR>
nmap <Leader>q :q!<CR>

" ---global search
nnoremap <Leader>g :call Global_Search()<CR>

function! Global_Search()
  let search_word = input('Enter target: ')
  let dir = input('Enter Directory: ')
  execute "vimgrep " . search_word . "  " . dir  
endfunction

" ---set select 
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" ---set easy align
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

" --set python highlight
let Python3Syntax = 1


