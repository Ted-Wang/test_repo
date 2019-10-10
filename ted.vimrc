" -----------------Ted Wang base settings-------------------
set fencs=utf-8,gbk,gb2312,gb18030,ucs-bom,cp936,latin1
set nu
set showcmd
set hls incsearch
set ts=4 sts=4 sw=4 et
set shiftwidth=4
set clipboard=unnamed
syntax on
set nowrap
set hidden           " Allow buffer switching without saving
set virtualedit=onemore             " Allow for cursor beyond last character
set nospell                         " Spell checking off, because it's impact Chinese characters a lot
set history=1000     " default is 50 or 200 or etc...
set viewoptions=folds,options,cursor,unix,slash   " Better Unix / Windows compatibility	----这行到底做了什么，得找机会试试
set whichwrap=b,s,<,>,[,]              " 默认值是b,s 在行首按←或者在行尾按→是不能将光标移动至上一行或下一行的。

colorscheme desert   "

set noundofile         " So is persistent undo ... enable this option will create a lots of temp files in ~/.vimundo/
let mapleader = ','

silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! MINGW()
    return has('unix') && !has('macunix') && has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction

if has('gui_running')
	set lines=50 columns=120 
	set cursorline        " Highlight current line
elseif MINGW()            " for vim in git-bash
	set lines=50 columns=120 
	set cursorline        " Highlight current line
endif

" the following piece if copied from spf13/.vimrc
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" font settings
if has('gui_running')
    set guioptions-=T           " Remove the toolbar
    if LINUX()
        set guifont=Andale\ Mono\ Regular\ 10,Menlo\ Regular\ 10,Consolas\ Regular\ 10,Courier\ New\ Regular\ 10
    elseif OSX()
        set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
    elseif WINDOWS()
        set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
    endif
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
    "set term=builtin_ansi      " Make arrow and other keys work
endif

set ruler                                           " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)  " A ruler on steroids
" set format statusline. This option override the ruler?
set laststatus=2
set statusline=%<%f\%w%h%m%r\ [%{&ff}/%Y]\ [%{getcwd()}]%=%-14.(%=\:b%n%y%m%r%w\ %l,%c%V%)\ %p%%
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif    " Always switch to the current file directory
" -----------------Ted Wang base settings end-------------------

