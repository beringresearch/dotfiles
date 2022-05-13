"library() File: .vimrc
" Author: Bering Limited 
""

" Gotta be first

call plug#begin('~/.vim/plugged')
" ----- Vim themes---------- ------------------------------------------
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" ----- Vim as an IDE -------------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'jpalardy/vim-slime'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" ----- Python Tooling ------------------------------------------------
Plug 'w0rp/ale'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" ----- Git Tooling ---------------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" ---- Extras/Advanced plugins ----------------------------------------
Plug 'tpope/vim-surround'

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
set encoding=UTF-8

" ----- Plugin-Specific Settings --------------------------------------
"set background=dark
"syntax on
"silent! colorscheme cobalt2syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

" ----- GO Settings -------------------
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" ----- bling/vim-airline settings -----
set laststatus=2
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'

" YCM syntax completions
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = "!"
let g:syntastic_python_checkers = ['pyflakes']
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- vim-slime settings ------
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1

let g:slime_no_mappings = 1
xmap <c-c> <Plug>SlimeRegionSend
nmap <c-c> <Plug>SlimeParagraphSend

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ------NERD Tree settings --------
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='<ENTER>'

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

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
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
