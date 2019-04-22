set nocompatible	" not compatible with the old-fashion vi mode"
filetype indent off " required
syntax off

" Plug mg use vim-plug
" My Plugins here:
" original repos on github
call plug#begin("~/.vim/plugged")
  Plug 'liuchengxu/vim-which-key'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'airblade/vim-gitgutter'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'Townk/vim-autoclose'
  Plug 'majutsushi/tagbar'
  Plug 'tpope/vim-fugitive'
  Plug 'Yggdroot/indentLine'
  Plug 'JulesWang/css.vim'
  Plug 'bling/vim-airline'
  Plug 'moll/vim-node'
  Plug 'elzr/vim-json'
  Plug 'tpope/vim-surround'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'terryma/vim-expand-region'
  Plug 'hdima/python-syntax'
  Plug 'rizzatti/dash.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'pangloss/vim-javascript'
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'ervandew/supertab'
  Plug 'mileszs/ack.vim'
  Plug 'sebdah/vim-delve'
  Plug 'buoto/gotests-vim'
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-gocode.vim'
call plug#end()

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

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

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

" setting asyncomplete
set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif " To auto close preview window when completion is done.

""""""""""""""""""""""
" Setting tab & space"
""""""""""""""""""""""

" ---set File type tab space
autocmd FileType java set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType c set tabstop=4|set shiftwidth=4|set expandtab

" --set go project file type
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

"=======================================================
"            Mapping Key use vim-which-key             "
"     Create menus based on existing mappings
"=======================================================

set timeoutlen=500
" vim code Fold
let mapleader = ","
nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
call which_key#register('<Space>', "g:which_key_map")

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" --vim-delve
autocmd FileType go nmap <leader>db :DlvToggleBreakpoint<CR>
autocmd FileType go nmap <leader>dt :DlvToggleTracepoint<CR>
autocmd FileType go nmap <leader>dc :DlvClearAll<CR>
autocmd FileType go nmap <leader>dd :DlvDebug<CR>
autocmd FileType go nmap <leader>dT :DlvTest<CR>

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

" --set insert fast key
imap <C-l> <C-O>o
imap jk <ESC>

" --set go filetype map
" Go File mapping setting ------ {{{
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>e <Plug>(go-rename)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
autocmd FileType go nmap <leader>co <Plug>(go-coverage)
nnoremap <C-b> :b 1<CR>
"}}}

" --set multi cursor
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" --set tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"

""""""""""""""""""""""""""""""
"  Language Server setting   "
""""""""""""""""""""""""""""""
