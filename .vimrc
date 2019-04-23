set nocompatible	" not compatible with the old-fashion vi mode"
filetype indent off " required
syntax off

" Plug mg use vim-plug
" My Plugins here:
" original repos on github
call plug#begin("~/.vim/plugged")
  Plug 'liuchengxu/vim-which-key'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'majutsushi/tagbar'
  Plug 'tpope/vim-fugitive'
  Plug 'Yggdroot/indentLine'
  Plug 'bling/vim-airline'
  Plug 'moll/vim-node'
  Plug 'elzr/vim-json'
  Plug 'tpope/vim-surround'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'terryma/vim-expand-region'
  Plug 'rizzatti/dash.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'ervandew/supertab'
  Plug 'sebdah/vim-delve'
  Plug 'buoto/gotests-vim'
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-gocode.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'wsdjeg/FlyGrep.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
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

" --- indentLine
let g:indentLine_color_term = 239

" ---set json-vim
let g:vim_json_syntax_conceal = 0

" ---set search highlight
set hlsearch

" --set python highlight
let Python3Syntax = 1

" ---Setting Golang {{{
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

let g:go_metalinter_enabled = ['vet', 'golint']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "3s"
"---}}}

" setting asyncomplete
set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif " To auto close preview window when completion is done.

" set flygrep
let g:spacevim_debug_level = 0
let g:spacevim_search_highlight_persist = 1

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
let mapleader=","
let g:maplocalleader = ","
nnoremap <silent> <leader>           :<c-u>WhichKey ','<CR>
nnoremap <silent> <localleader>      :<c-u>WhichKey ','<CR>
let g:which_key_map = {}

call which_key#register(',', "g:which_key_map")
" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" ---nerdTree in Explorer mappping {{{
let g:which_key_map['n'] = {
      \ 'name': '+Explorer',
      \ 'n': ['Explore', 'open-explore'],
      \ 'r': ['Rexplore', 'r-explore'],
      \ 'h': ['Hexplore', 'h-explore'],
      \ 'v': ['Vexplore', 'v-explore'],
      \ 't': ['Texplore', 'new-window-explore'],
      \ 'w': ['<c-w><c-w>', 'focus-next-explore'],
      \ ']': ['gt', 'toggle-window-explore'],
      \ }
nnoremap <Leader>nn :Explore<CR>
nnoremap <Leader>nr :Rexplore<CR>
nnoremap <Leader>nh :Hexplore<CR>
nnoremap <Leader>nv :Vexplore<CR>
nnoremap <Leader>nt :Texplore<CR>
nnoremap <Leader>nw <c-w><c-w>
nnoremap <Leader>n] gt
" }}}

" ---Delve mapping {{{
let g:which_key_map['d'] = {
      \ 'name': '+Delve',
      \ 'b': ['DlvToggleBreakpoing', 'toggle-break-point'],
      \ 't': ['DlvToggleTracepoint', 'toggle-trace-point'],
      \ 'c': ['DlvClearAll', 'clear-all'],
      \ 'd': ['DlvDebug', 'debug'],
      \ 'T': ['DlvTest', 'test']
      \ }
autocmd FileType go nmap <leader>db :DlvToggleBreakpoint<CR>
autocmd FileType go nmap <leader>dt :DlvToggleTracepoint<CR>
autocmd FileType go nmap <leader>dc :DlvClearAll<CR>
autocmd FileType go nmap <leader>dd :DlvDebug<CR>
autocmd FileType go nmap <leader>dT :DlvTest<CR>
" }}}

" --tarbar
let g:which_key_map['t'] = ["TagbarToggle", 'Tagbar']
nnoremap <leader>t :TagbarToggle<CR>

" ---set search highlight
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" ---set quitfix map {{{
let g:which_key_map['c'] = {
      \ 'name': '+QuickFix',
      \ 'n': ['cnext<CR>', 'next'],
      \ 'p': ['cprev<CR>', 'prev'],
      \ 'w': ['copen<CR>', 'open'],
      \ 'c': ['cclose<CR>', 'close'],
      \ 'l': ['call setqflist([])<CR>', 'clear'],
      \ }
nnoremap <Leader>cn :cnext<CR>
nnoremap <Leader>cp :cprev<CR>
nnoremap <Leader>cw :copen<CR>
nnoremap <Leader>cc :cclose<CR>
nnoremap <Leader>cl :call setqflist([])<CR>
" }}}

"" ---set easymontion ex: nmap s <Plug>(easymotion-s) {{{
map  / <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  m <Plug>(easymotion-prev)
nmap s <Plug>(easymotion-s2)
" }}}

"" -- set person mapping use mac
nnoremap <c-a> ggVG
nnoremap <C-s> :wq<CR> :echo "Saved"<CR>

" -- set buffer mapping {{{
let g:which_key_map['b'] = {
      \ 'name': '+Buffers',
      \ 'n': ['bnext', 'next'],
      \ 'p': ['bprev', 'prev'],
      \ 'l': ['buffers', 'buffers'],
      \ }
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bl :buffers<CR>
" ---}}}

" -- set ctags go to define
nnoremap gd <C-]>
nnoremap gb <C-T>

" ---set window size
nnoremap <C-j> :resize +5<CR>
nnoremap <C-k> :resize -5<CR>
nnoremap <C-h> :vertical resize -5<CR>
nnoremap <C-l> :vertical resize +5<CR>

" ---quit and save file
let g:which_key_map['s'] = ['w\!', 'save-file']
let g:which_key_map['q'] = ['q\!', 'quit-file']
nnoremap <Leader>s :w!<CR>
nnoremap <Leader>q :q!<CR>

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

" ---help folding {{{
let g:which_key_map['z'] = {
      \ 'name': '+Help Folding',
      \ 'a': ['open/close fold', 'open/close-fold'],
      \ 'c': ['close current open fold', 'close-current-fold'],
      \ 'o': ['open current fold', 'open-current-fold'],
      \ 'm': ['close all fold', 'close-all-fold'],
      \ 'r': ['open all fold', 'open-all-fold'],
      \ 'j': ['jump next fold', 'jump-next-fold'],
      \ 'k': ['jump prev fold', 'jump-prev-fold'],
      \ }
"  }}}

" --set ultisnip
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" --set flygrep

let g:which_key_map['g'] = ["FlyGrep", 'flygrep']
nnoremap <leader>g :FlyGrep<CR>


""""""""""""""""""""""""""""""
"  Language Server setting   "
""""""""""""""""""""""""""""""
call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
    \ 'name': 'gocode',
    \ 'whitelist': ['go'],
    \ 'completor': function('asyncomplete#sources#gocode#completor'),
    \ 'config': {
    \    'gocode_path': expand('~/go/bin/gocode')
    \  },
    \ }))
