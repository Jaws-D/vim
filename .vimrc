" =========================
" 基础设置
" =========================
set number              " 显示行号
syntax on               " 语法高亮（注意：不能加 set）
set autoindent          " 自动缩进
set smartindent         " 智能缩进（适用于代码）
set tabstop=4           " 设置 Tab 宽度为 4
set shiftwidth=4        " 设置缩进宽度为 4
set expandtab           " 用空格代替 Tab
set backspace=indent,eol,start " 允许退格键删除缩进、换行和插入模式的字符
set cmdheight=2
" =========================
" 界面优化
" =========================
set showmatch           " 高亮匹配的括号
set hlsearch            " 高亮搜索结果
set incsearch           " 输入时就显示匹配
set ignorecase          " 搜索时忽略大小写
set smartcase           " 但如果搜索包含大写字母，则区分大小写
set wrap                " 允许自动换行
set showcmd             " 显示输入的命令
set ruler               " 显示光标位置
set cursorline          " 高亮当前行
set laststatus=2        " 始终显示状态栏
colorscheme desert      " 颜色主题（沙漠色调）

" =========================
" 文件相关
" =========================
filetype on             " 启用文件类型检测（注意：不能加 set）
set encoding=utf-8      " 设置编码为 UTF-8
set fileencoding=utf-8  " 保存时使用 UTF-8 编码
set autowrite           " 自动保存文件
set autoread            " 文件被外部修改时自动更新
set nobackup            " 不生成 *.bak 备份文件
set nowritebackup       " 关闭写入时的备份文件
set noswapfile          " 关闭交换文件（避免 *.swp 文件）

" =========================
" 折叠功能（兼容性设置）
" =========================
set foldmethod=indent   " 使用缩进进行代码折叠
set foldlevel=2         " 默认展开 2 级折叠
set foldenable          " 启用折叠
nnoremap <space> za     " 使用空格键开合折叠

" =========================
" 自动补全
" =========================
set completeopt=menu,menuone " 启用补全菜单
set wildmenu            " 命令行补全增强
set wildmode=longest:full " 选项补全方式
" 兼容性检查
if has("syntax") && has("autocmd")
    autocmd FileType c,cpp,python setlocal omnifunc=syntaxcomplete#Complete
endif

if filereadable("/usr/share/dict/words")
    set dictionary+=/usr/share/dict/words
endif

if has("clipboard")
    set clipboard=unnamed
endif

if v:version >= 800
" 确保 wildmenu 可用
if has("wildmenu")
    set wildmenu
endif

" 确保 completeopt 可用
if exists("+completeopt")
    set completeopt=menu,menuone
endif

" 确保 wildmode 设置不会影响旧版本 Vim
if v:version >= 700
    set wildmode=longest:full
endif
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
endif

" =========================
" 其他优化
" =========================
set timeoutlen=500      " 按键超时时间（适用于快捷键映射）
set history=1000        " 记录 1000 条历史命令
set clipboard=unnamed   " 允许 Vim 直接使用系统剪贴板（兼容性更好）
set shortmess+=c        " 精简命令行消息
set updatetime=1000     " 减少 CursorHold 触发时间，提高响应速度

" =========================
" 粘贴模式（防止粘贴代码错乱）
" =========================
set pastetoggle=<F2>    " 按 F2 开关粘贴模式，防止粘贴时缩进错乱

" =========================
" 快捷键映射（通用设置）
" =========================
nnoremap <C-s> :w<CR>   " Ctrl+S 保存
nnoremap <C-q> :q!<CR>  " Ctrl+Q 退出不保存
nnoremap <C-a> ggVG     " Ctrl+A 选中整个文件
nnoremap <C-c> "+y      " Ctrl+C 复制到系统剪贴板
nnoremap <C-v> "+p      " Ctrl+V 从系统剪贴板粘贴
nnoremap <C-x> "+d      " Ctrl+X 剪切到系统剪贴板
nnoremap <C-z> u        " Ctrl+Z 撤销
nnoremap <C-y> <C-r>    " Ctrl+Y 反撤销
nnoremap <C-n> :tabnew<CR> " Ctrl+N 新建标签页
nnoremap <C-Tab> :tabnext<CR> " Ctrl+Tab 切换标签页

" =========================
" 退出时自动保存
" =========================
autocmd BufLeave * silent! wa

" =========================
" 关闭 Vim 时自动关闭所有标签页
" =========================
autocmd VimLeave * :qa!
