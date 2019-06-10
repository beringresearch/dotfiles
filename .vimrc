"library() File: .vimrc
" Author: Ignat Drozdov 
""

" Gotta be first

call plug#begin('~/.vim/plugged')
" ----- Making Vim look good ------------------------------------------
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'crusoexia/vim-monokai'
Plug 'gertjanreynaert/cobalt2-vim-theme'

" ----- Vim as a programmer's text editor -----------------------------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/a.vim'
Plug 'jpalardy/vim-slime'
Plug 'Yggdroot/indentLine'
Plug 'rizzatti/dash.vim'

" ----- Vim as Python IDE ---------------------------------------------
Plug 'davidhalter/jedi-vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" ----- Working with Git ----------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plug 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
Plug 'jez/vim-superman'
Plug 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plug 'jez/vim-c0'
Plug 'jez/vim-ispc'
Plug 'kchmck/vim-coffee-script'

" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
"Plugin 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
Plug 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
"Plugin 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
"Plugin 'HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
"Plugin 'edkolev/tmuxline.vim'
" All the other syntax plugins I use
"Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'tpope/vim-liquid'
"Plugin 'cakebaker/scss-syntax.vim'

call plug#end()

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set cursorline

set mouse=a

" ----- Plugin-Specific Settings --------------------------------------
" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "dark" for light colorscheme
"let g:solarized_termtrans = 1
set background=dark
"colorscheme solarized

syntax on
colorscheme cobalt2
"set termguicolors


"set t_Co=256   " This is may or may not needed.

"set background=light
"colorscheme PaperColor


let g:vim_json_syntax_conceal = 0

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2
" let g:airline_theme='papercolor'

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" YCM syntax completions
"let g:ycm_path_to_python_interpreter = '/PATH/TO/PYTHON/'


" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = "!"
let g:syntastic_python_checkers = ['pyflakes']
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- vim-slime settings ------
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

let g:slime_no_mappings = 1
xmap <c-c> <Plug>SlimeRegionSend
nmap <c-c> <Plug>SlimeParagraphSend

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ---- vim-conda
let g:jedi#force_py_version = 3
let g:UltisnipsUsePythonVersion = 3

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END" 

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

let g:indentLine_color_term = 239
let g:indentLine_char = '┊'

" Easier switching between tabs
map <t> :tabn<CR>
