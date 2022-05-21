set nu
set nocompatible
filetype off
syntax on
filetype plugin indent on
set ic
set hlsearch
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,GB2312,big5
set cursorline
set autoindent
set smartindent
set scrolloff=4
set showmatch

" key maps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap jk <ESC>

" python features
let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99
au Filetype cpp set tabstop=4
au Filetype cpp set softtabstop=4
au Filetype cpp set shiftwidth=4
au Filetype cpp set textwidth=79
au Filetype cpp set expandtab
au Filetype cpp set autoindent
au Filetype cpp set fileformat=unix
autocmd Filetype cpp set foldmethod=indent
autocmd Filetype cpp set foldlevel=99

" one-press run (most lang)
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
		if !isdirectory('build')
			execute "!mkdir build"
		endif
                exec "!g++ % -o ./build/%< && time ./build/%<"
                " exec "!time ./build/%<"
        elseif &filetype == 'cpp'
		if !isdirectory('build')
			execute "!mkdir build"
		endif
                exec "!g++ % -o ./build/%< && time ./build/%<"
                " exec "!time ./build/%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc

" add file templates
autocmd BufNewFile * exec ":call SetTitle()" 
func SetTitle()
    if &filetype == 'sh' 
        call setline(1,"#!/bin/bash") 
        call append(line("."),"############################") 
        call append(line(".")+1, "# File Name: ".expand("%"))
        call append(line(".")+2, "# Author : TyhiLa")
        call append(line(".")+3, "# QQ : 3055255696")
        call append(line(".")+4, "# Email:hoshimaemi@outlook.com")
        call append(line(".")+5, "# Blog：Null")
        call append(line(".")+6, "# Created Time: ".strftime("%c"))
        call append(line(".")+7, "#########################")
        call append(line(".")+8, "")

    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"############################")
        call append(line(".")+1, "# File Name: ".expand("%"))
        call append(line(".")+2, "# Author : TyhiLa")
        call append(line(".")+3, "# QQ : 3055255696")
        call append(line(".")+4, "# Email:hoshimaemi@outlook.com")
        call append(line(".")+5, "# Blog：Null")
        call append(line(".")+6, "# Created Time: ".strftime("%c"))
        call append(line(".")+7, "#########################")
        call append(line(".")+8, "")

    else
        call setline(1, "/***") 
        call append(line("."), "############################")
        call append(line(".")+1, "# File Name: ".expand("%"))
        call append(line(".")+2, "# Author : TyhiLa")
        call append(line(".")+3, "# QQ : 3055255696")
        call append(line(".")+4, "# Email:hoshimaemi@outlook.com")
        call append(line(".")+5, "# Blog：Null")
        call append(line(".")+6, "# Created Time: ".strftime("%c"))
        call append(line(".")+7, " **/") 
        call append(line(".")+8, "")
	

    endif

    if &filetype == 'cpp'
        call append(line(".")+9, "#include <iostream>")
        call append(line(".")+10, "using namespace std;")
	call append(line(".")+11, "int main() {")
	call append(line(".")+12, "}")
    endif
    if &filetype == 'c'
        call append(line(".")+9, "#include <stdio.h>")
        call append(line(".")+10, "")
    endif
endfunc
autocmd BufNewFile * normal G


" Vundle Plugin Manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'w0rp/ale'
"Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasiser/vim-code-dark'
Plugin 'preservim/nerdcommenter'
Plugin 'vim-autoformat/vim-autoformat'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'
Plugin 'sudar/vim-arduino-syntax'
call vundle#end()
filetype plugin indent on

nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 4
let g:autoformat_retab = 4
let g:autoformat_remove_trailing_spaces = 4
let g:formatdef_clangformat_google = '"clang-format -style google -"'
let g:formatters_c = ['clangformat_google']

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty= '⚡'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }}

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


"set Nerdtree
"autocmd VimEnter * NERDTree
"letNERDTreeWinPos="left"
map <C-n> :NERDTreeToggle<CR>

" -------YouCompeleteMe--------
let g:ycm_clangd_binary_path="/data/data/com.termux/files/usr/bin/clangd"
" disable ycm syntax check
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

"ycmd setting
let g:ycm_error_symbol = 'K'
let g:ycm_warning_symbol = 'O'

" ------------Ale-------------
"always display sign column
let g:ale_sig_column_always = 0
let g:ale_set_highlights = 1
let g:ale_sign_error = "E"
let g:ale_sign_warning = "W"

"vim with ale
let g:ale_statusline_format = ['XXH  %d','W  %d','OK']

"Display linter name, error, warning etc.
let g:ale_echo_msg_error_str = "E"
let g:ale_echo_msg_warning_str = "W"
let g:ale_echo_msg_format = '[%linter%] %s [%serverity%]'

"Do synax check only while Saving
let g:ale_lint_on_text_changed = "never"
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_linters = {
                        \'c':['clang'],
                        \'c++':['clang'],
                        \}

"next/prev error warning
nmap sp <Plug>(ale_previous_wrap)
nmap np <Plug>(ale_next_wrap)

"synax checking
nmap <Leader>s :ALEToggle<CR>

"view detail
nmap <Leader>d :ALEDetail<CR>

