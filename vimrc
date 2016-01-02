" ========================== Setup ===========================
" Make sure Vim settings is used (Needs to be first)
set nocompatible

" source ~/.vimrc.before if it exists
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif


" ====================== General Config ======================
set relativenumber              " It's awesome
set numberwidth=5
if v:version > 703
  set number                    " Sometimes it's good to know where you are
endif
set backspace=indent,eol,start  " Normal backspace behavior
set history=500                 " Store some history
set showcmd                     " Display incomplete commands
set showmode                    " Show current mode
set autoread                    " Reload files changed outside of Vim
set secure                      " Limit what modelines and autocmd can do
set autowrite                   " Write when action is taken
set clipboard=unnamed           " Use system clipboard for every yank

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Turn on syntax highlighting
syntax on

" Set the leader to be comma, I find it easy to reach and it's not
" as disturbing as space.
" Make sure this is loaded before loading plugins.
let mapleader=","

" Set modeline to 1 to allow rcfiles to be recognized as vim files
set modelines=1


" ========================== Files ===========================
" I don't want any swap-files
set nobackup
set nowritebackup
set noswapfile

" Persist undo
let undodir = expand('~/.undo-vim')
if !isdirectory(undodir)
  call mkdir(undodir)
endif
set undodir=~/.undo-vim
set undofile " Create FILE.un~ files for persistent undo


" ========================= Plugins ==========================
" https://github.com/junegunn/vim-plug
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


" ======================= Indentation ========================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>


" ========================= visuals ==========================
colorscheme solarized
filetype plugin on
filetype indent on

" Display tabs and trailing spaces
set list listchars=tab:»·,trail:·

set textwidth=120
set background=dark
set t_Co=256
highlight ColorColumn ctermbg=234 guibg=#0d3943
let &colorcolumn="80,".join(range(120,999),",")


" Use cursorline in insert mode
:autocmd InsertEnter,InsertLeave * set cul!


" ======================== Scrolling =========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15    "Get more context
set sidescroll=1        "Scroll one column at the time


" ========================== Search ==========================
set incsearch       " Find the next match as we type
set hlsearch        " Highlight searches
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
nmap <F4> :silent noh<CR>


" ======================== Completion ========================
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif


" ====================== Windows/splits ======================
" Automatically rebalance windows
autocmd VimResized * :wincmd =

" Use ctrl-[hjkl] to navigate between splits!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

set splitbelow
set splitright


" ====================== Custom configs ======================
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call s:SourceConfigFilesIn('plug_configs')

" =========================== temp ===========================
" Make header
nnoremap <Leader>h :center 60<cr>hhv0r=A<space><esc>30A=<esc>d60<bar>0i"<space><esc>


" vim:ft=vim
