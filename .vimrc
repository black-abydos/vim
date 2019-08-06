call plug#begin('~/.vim/plugged')

"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim', { 'for': ['html','xhtml','css','sass','scss','xml'] }
Plug 'morhetz/gruvbox'
Plug 'lyokha/vim-xkbswitch'
call plug#end()

filetype plugin on
filetype indent on
 
let g:XkbSwitchEnabled       = 1
let g:XkbSwitchLib = 'C:\Program Files\Vim\vim81\libxkbswitch64.dll'  
let g:XkbSwitchIMappings     = ['ru']
let g:XkbSwitchSkipIMappings = {'*' : ['[', ']', '{', '}', "'", '<', '>', ',', '.', '"']}

colorscheme gruvbox

syntax on
set guifont=Consolas:h15
set encoding=utf-8
"let g:mapleader=','
set guioptions-=m  "del menu bar
set guioptions-=T  "del toolbar
set guioptions-=r  "del scrollbar
set number
set expandtab	
set tabstop=2
set shiftwidth=2
set wrap linebreak "Перенос текста по словам
set listchars=tab:·· " Показываем табы в начале строки точками
set list
set relativenumber

set ai " включим автоотступы для новых строк
set cin " включим отступы в стиле Си

set smarttab
set smartindent
set hlsearch "Подстветка всех совподений при поиске
set incsearch "Отображение частичных совпадений при поиске
set ignorecase "Игнорирование регистра
set wrap " попросим Vim переносить длинные строки
set ai " включим автоотступы для новых строк
set cin " включим отступы в стиле Си

"'NERDTree D:\Downloads

"mappings
map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
inoremap jk <Esc>
set timeoutlen=160 
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

" Включение поддержки русского языка
"set keymap=russian-jcukenwin
"set iminsert=0
"set imsearch=0
"highlight lCursor guifg=NONE guibg=Cyan

set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"on spell
"set spell spelllang=us
"off spell
":setlocal spell spelllang=
":setlocal spell spelllang=ru_ru,en_us
":set nospell

"run default windows
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
 
" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p

" Toggle between last 2 buffers
nnoremap <leader><tab> <c-^>
