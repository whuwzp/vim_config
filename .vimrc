"-------------------------
" 系统设置

set mouse=a

" 关闭兼容模式
set nocompatible

" 不用保存就可以切换 
set hidden

" 搜索时不分大小写
set ic

" 定义快捷键的前缀，即<leader>                  Leader
let mapleader="\\"

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 解决退格键不能删除回车等的问题               系统其他设置
set backspace=indent,eol,start
" ESC键映射jk
inoremap jk <ESC>
" 删除buffer文档
nmap <leader>bd :bd<CR>i

" 高亮显示搜索结果                              高亮
set hlsearch
" 取消高亮单词
nnoremap <leader>no :noh<CR>

" 设置快捷键将选中文本块复制至系统剪贴板        复制粘贴   
vnoremap <leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <leader>p "+p
" 设置纯文本复制粘贴
map <F9> :set paste<CR>i
map <F10> :set nopaste<CR>

" 依次遍历子窗口                                窗口 多文档相关的
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口     
nnoremap <leader>wl <C-W>l
" 跳转至左方的窗口
nnoremap <leader>wh <C-W>h
" 跳转至上方的子窗口
nnoremap <leader>wk <C-W>k
" 跳转至下方的子窗口
nnoremap <leader>wj <C-W>j

" 多文档切换快捷键
map <leader>] :w<cr>:bn<cr>
map <leader>[ :w<cr>:bp<cr>
noremap <silent><leader>1 :bn1<cr>
noremap <silent><leader>2 :bn2<cr>
noremap <silent><leader>3 :bn3<cr>
noremap <silent><leader>4 :bn4<cr>
noremap <silent><leader>5 :bn5<cr>
noremap <silent><leader>6 :bn6<cr>
noremap <silent><leader>7 :bn7<cr>
noremap <silent><leader>8 :bn8<cr>
noremap <silent><leader>9 :bn9<cr>
noremap <silent><leader>0 :bn10<cr>


fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()

" 总是显示状态栏                              状态栏相关的
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
" set cursorcolumn

" 自适应不同语言的智能缩进                     tab 空格 缩进
filetype indent on
" 将制表符扩展为空格
set noexpandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 自动缩进
set autoindent

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 基于缩进或语法进行代码折叠                      代码折叠 
" set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 禁止折行
" set nowrap

" 设置环境保存项                                  环境历史保存                                                   
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存 undo 历史
set undodir=~/.undo_history/
set undofile
" 保存快捷键
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" 恢复快捷键
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>

" Man命令查看各类man信息                           man帮助
source $VIMRUNTIME/ftplugin/man.vim
" 定义:Man命令查看各类man信息的快捷键
nmap <leader>m1 :Man 1 <cword><CR>:set nu<CR>
nmap <leader>m2 :Man 2 <cword><CR>:set nu<CR>
nmap <leader>m3 :Man 3 <cword><CR>:set nu<CR>
nmap <leader>m4 :Man 4 <cword><CR>:set nu<CR>
nmap <leader>m5 :Man 5 <cword><CR>:set nu<CR>
nmap <leader>m6 :Man 6 <cword><CR>:set nu<CR>
nmap <leader>m7 :Man 7 <cword><CR>:set nu<CR>
nmap <leader>m8 :Man 8 <cword><CR>:set nu<CR>
nmap <leader>md :Man 

"  编译                                                编译
nmap <leader>mk :w<CR>:!./build.sh<CR>
nmap <leader>mg :w<CR>:!./run.sh<CR>

"---------------------------------------------------------------
" vundle 插件设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/ctrlp.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" 补全类
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'SirVer/ultisnips'

" 主题颜色类
Plugin 'vim-airline/vim-airline'                                      
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'

" 代码高亮注释格式化类
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'crooloose/nerdcommenter'
Plugin 'vim-clang-format'

" 内容搜索替换
Plugin 'dyng/ctrlsf.vim' 
Plugin 'mileszs/ack.vim'
Plugin 'yegappan/grep'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ctrlpvim/ctrlp.vim'

" ctags标签书签相关
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'kshenoy/vim-signature' 

" 结对符相关
Plugin 'gcmt/wildfire.vim'
Plugin 'tpope/vim-surround'

" 其他
Plugin 'derekwyatt/vim-fswitch'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

" --------------------------------------------------补全类 
" Youcompleteme                                    语义补全
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 使用全局的ycm_extra_conf文件配置
" let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
" set tags+=/usr/include/c++/7/stdcpp.tags, 我只使用clang中的就好
set tags+=/usr/local/include/c++/v1/clang.tags " c++ 标准
set tags+=/usr/include/ctags.tags " 包含一些Linux系统的

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=3
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全           
let g:ycm_seed_identifiers_with_syntax=1
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
" 设置用于关闭补全列表的快捷键，默认为ctrl+y
let g:ycm_key_list_stop_completion = ["/"]

" SirVer/ultisnips                                模板补全
" mysnippets路径: ~/.vim/bundle/ultisnips/mysnippets/cpp.snippets
let g:UltiSnipsSnippetDirectories=["~/.mysnippets"]
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" vim-protodef                                   定义和实现自动生成
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
nmap <buffer> <silent> <leader>cpp :set paste<cr>i<c-r>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({})<cr><esc>='[:set nopaste<cr>
 
" ----------------------------------------------------主题颜色类
" airline                                            状态栏等配色
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'

" molokai                                            主题                                                   
set background=dark
set t_Co=256
colorscheme molokai

" -------------------------------------------------代码高亮注释格式化类
" vim-cpp-enhanced-highlight                        cpp语法高亮
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1 
let g:cpp_experimental_simple_template_highlight = 1
syntax keyword cppSTLtype initializer_list

" vim-indent-guides                                   缩进显示                                                         
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <leader>i <Plug>IndentGuidesToggle

"clang-format                                          代码风格格式化
" map to <leader>cf in C++ code
" 可以在~/.clang-format中编辑更加详细的设置
set ts=4
" 退出insert模式时自动格式化, 如果加了这个那么ultisnip插件就会受影响,因为模板补全后会由insert变为select,这样会同时触发clang-format和ultisnip 
" let g:clang_format#auto_format_on_insert_leave=1
autocmd FileType c,cpp,objc nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><leader>cf :ClangFormat<CR>

" nerdcommenter                                    代码注释
" 默认<leader>cc, <leader>cu

" -------------------------------------------------------内容搜索替换
" ctrlsf.vim                                      搜索               
" 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
noremap <leader>sp :CtrlSF<CR>

" vim-multiple-cursors                          选中多选
" 默认是ctrl+N,这里不修改
" let g:multi_cursor_next_key='<S-n>'
" let g:multi_cursor_skip_key='<S-k>'

" ctrlp                                                          搜索文件 buffer
" 中文版使用说明：~/.vim/bundle/ctrlp.vim/doc/ctrlp.cnx
let g:ctrlp_show_hidden = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = '~/.cache/ctrlp'

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(swp|so|a)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
" 当前文件所在目录
nnoremap <leader>fl :CtrlP %:h<cr>
" 当前用户目录
nnoremap <leader>fu :CtrlP ~<cr>
" 自定义目录
nnoremap <leader>fd :CtrlP 
" buffer
nnoremap <leader>fb :CtrlPBuffer<cr>
" mixed mode
nnoremap <leader>fm :CtrlPMixed<cr>
" history
nnoremap <leader>fh :CtrlPMRU

"---------------------------------------------------------------ctags标签相关
" indexer                                         自动更新标签                                                     
" 修改ctags生成tags文件的参数
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
" let g:indexer_disableCtagsWarning=1

" tagbar                                              标签窗口
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：tag bar
nnoremap <leader>tb :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=16
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 自动设置焦点在tagbar
let g:tagbar_autofocus = 1 
" 设置自动打开tagbar
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()                          

" 设置 ctags 对哪些代码标识符生成标签                                 
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
         \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" vim-signature                                   收藏书签
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }



" -------------------------------------------------------结对符相关
" wildfire.vim                                        结对符内容选中
" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <leader><SPACE> <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]

" vim-surround                                      选中内容加结对符
vmap " S"
vmap ' S'
vmap ` S`
vmap [ S[
vmap ( S(
vmap { S{
vmap } S}
vmap ] S]
vmap ) S)
vmap > S>

"  vim-fswitch                                        h和cpp快速切换                                                   
nmap <silent> <leader>sw :w<CR>:FSHere<cr>

