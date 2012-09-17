set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

filetype plugin on
filetype plugin indent on

" 设置菜单语言
set langmenu=zh_cn

" 获取当前目录
function! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

" 状态栏显示目前所执行的指令
set showcmd 

"--------------- 设置命令行和状态栏 ---------------
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)

set statusline=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]\ %l\|\%L,%c\ %=\ %P 

" ---------- 字体显示 ----------
"set guifont=Monaco:h11	" 设置字体为Monaco 大小为12号
set guifont=Consolas:h12	" 设置字体为Monaco 大小为12号
"set guifontwide=幼圆:h11:b	"设置宽字节使用的字体


" 自动切换到文件当前目录
set autochdir

"在查找时忽略大小写
set ignorecase
set incsearch
set hlsearch

"在所有模式下都允许使用鼠标，还可以是n,v,i,c等
set mouse=a

colo wombat	"soso			"设置配色方案
syntax on					"语法高亮显示


"-------------- 关于制表符和缩进 ----------------
set tabstop=4				"制表符为4
set softtabstop=4
set shiftwidth=4			"统一缩进为4
set smarttab				
set smartindent				
set autoindent				"自动缩进
set cindent				"C/C++语言格式缩进

"---------------- 其它设置项 --------------------
set number 
set linespace=1				"设置行距
set ignorecase				"忽略大小写
"set noignorecase			"不忽略大小写
set nobackup				"不备份
set nowritebackup			"不备份
set noswapfile				"不产生交换文件
"set dir=c:\\tmp				"设定交换文件目录
set helplang=cn,en			"帮助文件使用语言
"set fdm=syntax				"按语法自动折叠
set showmatch				"括号匹配
set fileencodings=utf-8,chinese,gbk,gb2312,gb18030,utf-16,big5,latin-1		"vim打开文件时的尝试使用的编码





"-------------- 关于GUI界面 ----------------
"winpos 100 110				"启动窗口初始坐标
set lines=32				"启动窗口高
set columns=150				"启动窗口宽


if (has("gui_running"))
	"图形界面下的设置
	"-------------- 设置编码格式为UTF-8 -------------
	"这样设置会导致菜单、右键、console乱码
	"但是这样设置可以让VIM中的中文显示为指定字体
	set encoding=utf-8
	language messages zh_CN.utf-8	"设置界面提示信息为zh_CN.utf-8【解决乱码】
	"【解决菜单乱码】
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	"------------------------------------------------

    set nowrap
    set cursorline		" 高亮当前所在行
	set go-=T			" 去掉Toolbar
"	set go= "无菜单、无工具栏 （m: Menu	T: Toolbar	e: Tabbar）
"	set go+=e "使用窗口化Tabbar，-e时使用字符界面Tabbar
else
	"字符界面下的设置
    set wrap
endif

"---------------- 语法高亮设置 ------------------
"设置ActionScript文件高亮显示，要配合语法文件使用
"文件格式：*.mxml *.as
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript


au BufNewFile,BufRead *.txt set filetype=txt

"---------------- 键盘映射快捷键 ------------------
" F11最大化
map <F11> <Esc>:simalt ~x<CR>

" 按下F5使用python执行当前文件
map <D-r> :w<CR>:!python %<CR>

nmap ct i<Tab><Esc>					" 插入Tab键
nmap cs :nohlsearch<CR>				"用于清除查询出高亮的显示结果
nmap cm :%s/\r//g<CR>				"用于删除文件中多余的换行符（在VIM中看到的是蓝色的^M）
nmap cn :tabNext<CR>				"tab切换（没有发现两者的区别）
nmap cp :tabprev<CR>				"tab切换（没有发现两者的区别）
nmap cq :set nu<CR>					"显示绝对行号
nmap cz :set rnu<CR>				"显示相对行号

nmap ca cwvar<Esc>wwi:<Esc>p

"map <F3> <Esc>:WMToggle<CR>			"调用winmanager插件的WMToggle命令


" 编译配置文件
:command! EditConfig e ~/.gvimrc

" 让更新配置文件立即生效（:Flush）
:command! Flush source ~/.gvimrc

"设置窗口透明度 参数取值0-255(需要vimtweak.dll支持) (仅windows)
":command! -nargs=1 Alpha call libcallnr('vimtweak.dll', 'SetAlpha',<args>)

