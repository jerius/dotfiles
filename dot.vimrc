" jerius vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Explicitly get out of vi-compatible mode
set nocompatible

" Set dark background
set background=dark

set t_Co=256

" Always show the status line
set laststatus=2

" Don't insert any extra pixel lines between rows
set linespace=0

" Leave my cursor where it was
set nostartofline

" Set to auto read when a file is changed from the outside
set autoread

" Sets how many of lines VIM has to remember
set history=1000

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Show line numbers on the left
set number

" Configure clipboard to allow copy/paste via tmux
set clipboard=unnamed

set pastetoggle=<F2>

" Pathogen
execute pathogen#infect()

filetype plugin indent on
"let g:syntastic_json_checkers=['jsonlint']

" Powerline
let g:Powerline_symbols = 'fancy'

" Fugitive status line
"set statusline=%<\ %f\ %{fugitive#statusline()}
"
" Set color scheme
"color distinguished
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Wildmenu
set wildmenu
set wildmode=longest:full

" Always show current position
set ruler

" Change buffer without saving
set hid

" Set backpsace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase
set smartcase

" Highlight search
set hlsearch

" More browser-like searching
set incsearch

" Set magic on, for regular expressions
set magic

" Show matching braces when text indicator is over them
set showmatch
" How many tenths of a second to blink
set mat=2

" Highlight text that goes over the 80 char column limit
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
highlight OverLength ctermbg=darkgray guibg=#592929
match OverLength /\%81v.\+/

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on " enable Enables syntax highlighting

" Set font according to system
" Mac
set gfn=Menlo:h14
set shell=/bin/bash
set guioptions-=T
set t_Co=256
set nonu

set encoding=utf8
try
    lang en_US
catch
endtry

"Default file types
set ffs=unix,mac

" Highlight the current line
set cursorline
hi CursorLine cterm=NONE cterm=bold ctermbg=DarkGray guibg=DarkGray
"ctermbg=DarkSlateGray guibg=DarkSlateGray

" Set json file types properly
"au BufRead,BufNewFile *.json set filetype=json

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups, and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backups off. 
set nobackup
set nowb
set noswapfile

" Persistent undo
try
    set undodir=~/.undodir/
    set undofile
catch
endtry


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tabs and indents
""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" (sw)shiftwidth: how many columns text is indented with reindent operations
" (sts)softtabstop: how many columns vim uses when you hit tab
" (ts)tabstop: how many columns a tab counts for
set ts=2 sw=2 sts=2

set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expansions
""""""""""""""""""""""""""""""""""""""""""""""""""""""

vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto-complete for (, ", ', [, {
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

" remap for undotree
nnoremap <F5> :UndotreeToggle<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

set number

" Perl stuff
vmap ,pt :!perltidy<CR> 
nmap ,pt :%! perltidy<CR>

" Plugins
"
"
" FZF
set rtp+=/usr/local/opt/fzf

" TERRAFORM
let g:terraform_align=1
"let g:terraform_fold_sections=1
"let g:terraform_remap_spacebar=1
let g:terraform_fmt_on_save=1

" Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Autocomplete
"let g:neocomplete#enable_at_startup = 1
