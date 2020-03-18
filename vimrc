set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() "让vundle管理插件版本

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'gmarik/vundle'
Plugin 'Blackrush/vim-gocode'
Plugin 'alvan/vim-closetag'
Plugin 'buoto/gotests-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Chiel92/vim-autoformat' "自动格式化https://github.com/Chiel92/vim-autoformat
Plugin 'OmniSharp/omnisharp-vim' "C#代码补全提示
Bundle 'cespare/vim-golang'
call vundle#end()            " 必须


filetype plugin indent on
syntax on
set backspace=indent,eol,start
set autowrite
set number
set mouse=nv
set tabstop=4
set encoding=utf-8
set fencs=utf-8,GB18030,ucs-bom,default,latin1

noremap <F3> :Autoformat<CR> "F3格式化C#快捷键
"let g:formatdef_my_custom_cs = '"astyle --mode=cs --style=ansi -pcHs4"'
"let g:formatters_cs = ['my_custom_cs']

let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_build_constraints = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:rustfmt_autosave = 1

"let g:OmniSharp_server_use_mono = 1
"let g:OmniSharp_server_path = '/home/xuan/.cache/omnisharp-vim/omnisharp-roslyn'
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2

"golang自动导入
let g:gofmt_command = "goimports"
autocmd BufWritePre *.go :Fmt

" jj                  保存文件并留在插入模式 [插入模式]
imap jj <ESC>:w<CR>li
" kk                  返回Normal模式 插入模式
imap kk <ESC>l
