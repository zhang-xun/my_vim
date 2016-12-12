"" Configuration file for vim
set modelines=0        " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible
" Use Vim defaults instead of 100% vi compatibility
set backspace=2
" more powerful backspacing

syntax on
" 语法高亮

autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
" 用浅色高亮当前行

set smartindent
" 智能对齐

set autoindent
" 自动对齐

set confirm
" 在处理未保存或只读文件的时候，弹出确认

set tabstop=4
" Tab键的宽度

set softtabstop=4
set shiftwidth=4
"  统一缩进为4

set noexpandtab
" 不要用空格代替制表符

set number
" 显示行号

set history=500
" 历史纪录数

set hlsearch
set incsearch
" 搜索逐字符高亮

set gdefault
" 行内替换

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1
" 编码设置

"colorscheme blue
""colorscheme ron
colorscheme slate
" 设置颜色主题

"set guifont=Menlo:h16:cANSI
" 设置字体

set langmenu=zn_CN.UTF-8
set helplang=cn
" 语言设置

set cmdheight=2
" 命令行（在状态行）的高度，默认为1,这里是2

set ruler
" 在编辑过程中，在右下角显示光标位置的状态行

set laststatus=2
" 总是显示状态行

set showcmd
" 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来

set scrolloff=3
" 光标移动到buffer的顶部和底部时保持3行距离

set showmatch
" 高亮显示对应的括号

set matchtime=5
" 对应括号高亮的时间（单位是十分之一秒）

set autowrite
" 在切换buffer时自动保存当前文件

set wildmenu
" 增强模式中的命令行自动完成操作

set linespace=2
" 字符间插入的像素行数目

set whichwrap=b,s,<,>,[,]
" 开启Normal或Visual模式下Backspace键，空格键，左方向键，右方向键，Insert或replace模式下左方向键，右方向键跳行的功能。

filetype plugin indent on
" 分为三部分命令：file on, file plugin on, file indent on.分别表示自动识别文件类型，用文件类型脚本，使用缩进定义文件。

"==================自定义的键映射======================

vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

""inoremap (	()<left>
""inoremap [ []<left>
""inoremap " ""<left>
""inoremap ' ''<left>
""inoremap { {}<left>

" 括号自动生成

" 单键<F7>控制syntax on/off。原因是有时候颜色太多会妨碍阅读。

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! ./%<"
endfunc
" <F5>编译和运行C程序

map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
endfunc
" <F6>编译和运行C++程序


map <F4> : w<cr>:!python3 %<CR>

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

"let Tlist_Ctags_Cmd = '/usr/local/bin/ctags' 
"map <silent> <F2> :TlistToggle<cr>
"let Tlist_Show_One_File=1    "只显示当前文件的tags
"let Tlist_WinWidth=40        "设置taglist宽度
"let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
"let Tlist_Use_Left_Window=1 "在Vim窗口右侧显示taglist窗口

let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict'






"vim plugins
set nocompatible 
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'

Bundle 'majutsushi/tagbar' 
let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let g:tagbar_width=30
let g:tagbar_left=1
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
map <silent> <F1> :TagbarToggle<CR>

Bundle 'OmniCppComplete'
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteArrow=1
let OmniCpp_MaycompleteScope=1
let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DefaultNamespace=["std"]
let OmniCpp_ShowPrototypeInAbbr=1
let OmniCpp_SelectFirstItem=2


Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical"

Bundle 'myusuf3/numbers.vim'

Bundle 'Raimondi/delimitMate'
let delimitMate_expand_cr=1

Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"Vundle and NeoBundle users may instead use following command to powerline
Bundle 'powerline/powerline',{'rtp':'powerline/bindings/vim'}




set number
syntax enable
set background=dark
let g:solarized_termcolors = 256
filetype plugin indent on 





" vim  powerline 
set rtp+=/Users/zhangxun/Library/Python/3.4/lib/python/site-packages/powerline/bindings/vim
set guifont=Sauce\ Code\ Powerline:h14.5
set laststatus=2
set encoding=utf-8
set t_Co=256
set number
set term=xterm-256color
set termencoding=utf-8

" cancel up down left right 

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" for ycm
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>*'
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nmap <F7> :YcmDiags<CR>


