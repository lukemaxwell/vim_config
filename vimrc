set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Custom plugins
Plugin 'tpope/vim-fugitive'
Plugin 'syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'scrooloose/nerdtree'
Plugin 'othree/html5.vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'xolox/vim-misc'

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/dart-vim-plugin
endif

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/dart-vim-plugin
endif

" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
syntax on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

hi SpellBad ctermfg=015 ctermbg=001 guifg=#yyyyyy guibg=#zzzzzz

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checker_args="--ignore=E402"
let g:syntastic_python_flake8_post_args='--ignore=E402'
let g:flake8_show_quickfix=0

" flake8
autocmd BufWritePost *.py call Flake8()

" markdown
let g:vim_markdown_folding_disabled = 1
" let vim_markdown_preview_temp_file=1 " delete preview file after opening.

" Tab spaces
au FileType python setl ts=4 sw=4 sts=4 et
au FileType less setl ts=4 sw=4 sts=4 et
au FileType css setl ts=2 sw=2 sts=2 et
au FileType dart setl ts=4 sw=4 sts=4 et
au FileType html setl ts=2 sw=2 sts=2 et
au FileType yaml setl ts=2 sw=2 sts=2 et
au FileType lua setl ts=2 sw=2 sts=2 et


" Python strip whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
