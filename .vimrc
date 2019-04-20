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

  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'Townk/vim-autoclose'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'majutsushi/tagbar'
  Plugin 'tpope/vim-fugitive'
  Plugin 'honza/vim-snippets'
  Plugin 'garbas/vim-snipmate'
  Plugin 'Yggdroot/indentLine'
  Plugin 'JulesWang/css.vim'
  Plugin 'bling/vim-airline'
  Plugin 'moll/vim-node'
  Plugin 'elzr/vim-json'
  Plugin 'tpope/vim-surround'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'terryma/vim-expand-region'
  Plugin 'junegunn/vim-easy-align'
  Plugin 'hdima/python-syntax'
  Plugin 'rizzatti/dash.vim'
  Plugin 'ntpeters/vim-better-whitespace'
  Plugin 'pangloss/vim-javascript'
  Plugin 'fatih/vim-go'
  Plugin 'nsf/gocode', {'rtp': 'vim/'}
  Plugin 'ervandew/supertab'
  Plugin 'mileszs/ack.vim'
  Plugin 'sebdah/vim-delve'
  Plugin 'buoto/gotests-vim'

" General
if has("gui_running")     " GUI color and font settings
  set t_Co=256            " 256 color mode
end

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
set mouse=a
set mousehide
set clipboard=unnamed     " yank to the system register (*) by default
set showmode		  " Show current mode
set backspace=2		  " make backspace work Like most other apps
set cursorline
set showmatch " Auto pair find brackets
set wildmenu
set ttyfast " Faster redraw
set lazyredraw " Don't redraw statusline when switching between vim modes
set shortmess=tsIAW " No intro when starting Vim

" multi cursor
let g:multi_cursor_use_default_mapping=0

" nerdTree styles
let g:netrw_liststyle=3

" encoding settings
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" status Line
set laststatus=2

" set ctags path
set tags=./tags;/,$HOME/tags/tags;/

" set auto read
set autoread

" --- vim-gitgutter
let g:gitgutter_enabled = 1
highlight clear SignCloumn " For the same appearance as your Line number column

" ---ctrlp
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_show_hidden = 1


" --- indentLine
let g:indentLine_color_term = 239

" ---set json-vim
let g:vim_json_syntax_conceal = 0

" ---set search highlight
set hlsearch

" ---set easy align
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

" --set python highlight
let Python3Syntax = 1

" --set go project file type
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
let g:SuperTabDefaultCompletionType = "context"

" --set gotags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

let g:ackprg = 'ag --nogroup --nocolor --column'
let g:go_metalinter_enabled = ['vet', 'golint']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "3s"

""""""""""""""""""""""
" Setting tab & space"
""""""""""""""""""""""

" ---set File type tab space
autocmd FileType java set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType c set tabstop=4|set shiftwidth=4|set expandtab

" --set go project file type
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

""""""""""""""""""""""
"    Mapping Key     "
""""""""""""""""""""""

" vim code Fold
let mapleader = ","
let g:ctrlp_map = '<Leader>.'

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" --vim-delve
autocmd FileType go nmap <leader>dlb :DlvToggleBreakpoint<CR>
autocmd FileType go nmap <leader>dlt :DlvToggleTracepoint<CR>
autocmd FileType go nmap <leader>dlc :DlvClearAll<CR>
autocmd FileType go nmap <leader>dd :DlvDebug<CR>
autocmd FileType go nmap <leader>dt :DlvTest<CR>

" --Ack search
map <c-u> :Ack<space>

" --tarbar
nmap \\ :TagbarToggle<CR>

" ---set search highlight
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

" -- set person mapping use mac
nnoremap <C-a> ggVG
nnoremap <C-s> :wq<CR> :echo "Saved"<CR>

" -- set buffer mapping
nnoremap <C-b>n :bnext<CR>
nnoremap <C-b>p :bprev<CR>
nnoremap <C-b>l :buffers<CR>

" -- set ctags go to define
nnoremap gd <C-]>
nnoremap gb <C-T>

" ---nerdTree in Explorer mappping
nnoremap <Leader>nn :Explore<CR>
nnoremap <Leader>nr :Rexplore<CR>
nnoremap <Leader>nh :Hexplore<CR>
nnoremap <Leader>nv :Vexplore<CR>
nnoremap <Leader>nt :Texplore<CR>
nnoremap <Leader>w <c-w><c-w>
nnoremap <C-]> gt

" ---set window size
noremap <C-j> :resize +5<CR>
noremap <C-k> :resize -5<CR>
noremap <C-h> :vertical resize -5<CR>
noremap <C-l> :vertical resize +5<CR>

" ---quit and save file
nmap <Leader>s :w!<CR>
nmap <Leader>q :q!<CR>

" ---set select
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" ---set easy align
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" --set insert fast key
imap <C-l> <C-O>o
imap jk <ESC>

" --set go filetype map
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>e <Plug>(go-rename)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
autocmd FileType go nmap <leader>co <Plug>(go-coverage)
nnoremap <C-b> :b 1<CR>

" --set multi cursor
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
