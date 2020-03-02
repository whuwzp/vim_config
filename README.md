# vim 学习

1. 简介: 源码编译使用vim及其插件. 
2. 内容包含: vim的编译安装, llvm clang的编译安装, 插件youcompleteme的编译安装使用, 以及vim其他插件的使用.
3. 搭建环境: Ubuntu18.04.4 server版(desktop版应该也适用)
4. 环境还原方式: 
    - 坚果云上保存: `.vim`文件的压缩包,以免以后换环境时都得下载, 使用时直接解压至`~/.vim`
    - GitHub上保存: `.vimrc`, `.clang-format`, `.ycm_extra_conf.py`等配置文件, 地址: https://github.com/whuwzp/vim_config
5. 主要参考网址如下, 基本上都是参照官方方法, 而不是在博客网站上拾人牙慧: 
    - vim源码编译: https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source
    - llvm clang编译: https://llvhttps://m.org/docs/GettingStarted.html#getting-started-with-llvm
    - youcompleteme编译使用: https://github.com/ycm-core/YouCompleteMe#linux-64-bit
    - 其他c++插件: https://github.com/yangyangwithgnu/use_vim_as_ide。

Table of Contents
=================

   * [vim 学习](#vim-学习)
      * [1. vim源码编译安装](#1-vim源码编译安装)
      * [2. 源码编译安装llvm clang](#2-源码编译安装llvm-clang)
      * [3. youcompleteme编译安装](#3-youcompleteme编译安装)
      * [4. 插件](#4-插件)
         * [4.1 vundle插件管理器](#41-vundle插件管理器)
         * [4.2 补全类插件](#42-补全类插件)
            * [4.2.1 YouCompleteMe语义补全](#421-youcompleteme语义补全)
            * [4.2.2 vim-protodef接口实现补全](#422-vim-protodef接口实现补全)
            * [4.2.3 ultisnips模板补全](#423-ultisnips模板补全)
         * [4.3 主题颜色类](#43-主题颜色类)
            * [4.3.1 vim-airline和vim-airline-themes](#431-vim-airline和vim-airline-themes)
            * [4.3.2 molokai](#432-molokai)
         * [4.4 代码高亮注释格式化类](#44-代码高亮注释格式化类)
            * [4.4.1 vim-cpp-enhanced-highlight高亮](#441-vim-cpp-enhanced-highlight高亮)
            * [4.4.2 vim-indent-guides缩进](#442-vim-indent-guides缩进)
            * [4.4.3 clang-format 格式化](#443-clang-format-格式化)
            * [4.4.4  nerdcommenter代码注释](#444--nerdcommenter代码注释)
         * [4.5 内容搜索替换](#45-内容搜索替换)
            * [4.5.1 vim-multiple-cursors多选](#451-vim-multiple-cursors多选)
            * [4.5.2 ctrlsf.vim查找](#452-ctrlsfvim查找)
         * [4.6 ctags标签书签相关](#46-ctags标签书签相关)
            * [4.6.1 indexer自动更新标签](#461-indexer自动更新标签)
            * [4.6.2 tagbar标签栏](#462-tagbar标签栏)
            * [4.6.3 signature书签收藏](#463-signature书签收藏)
            * [4.6.4 LeaderF 文档和buffer搜索](#464-leaderf-文档和buffer搜索)
         * [4.7 结对符相关](#47-结对符相关)
            * [4.7.1 wildfire.vim结对符内容选中](#471-wildfirevim结对符内容选中)
            * [4.7.2 vim-surround选中内容加结对符](#472-vim-surround选中内容加结对符)
         * [4.8 其他](#48-其他)
            * [4.8.1 vim-fswitch在h和cpp中切换](#481-vim-fswitch在h和cpp中切换)
            * [4.8.2 nerdtree项目文档查看](#482-nerdtree项目文档查看)
      * [5. 使用](#5-使用)
         * [5.1 快捷键及设置](#51-快捷键及设置)
            * [5.1.1 光标移动](#511-光标移动)
            * [5.1.2 编辑操作](#512-编辑操作)
            * [5.1.3 窗口移动](#513-窗口移动)
         * [5.2 折叠代码](#52-折叠代码)
         * [5.3 高亮同名词](#53-高亮同名词)
         * [5.4 替换](#54-替换)
         * [5.5 环境保护](#55-环境保护)
         * [5.6 编译执行](#56-编译执行)
         * [5.7 窗口尺寸修改](#57-窗口尺寸修改)
         * [5.8 纯本文复制](#58-纯本文复制)
         * [5.9 系统剪切板](#59-系统剪切板)
         * [5.10 man支持](#510-man支持)


## 1. vim源码编译安装

参考网址: https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source

1. 安装各类依赖库
    ```sh
    sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git
    ```
2. 下载最新版vim并编译

    ```sh
    git clone git@github.com:vim/vim.git
    cd vim/

    ./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=gtk2 \
    --enable-cscope \
    --enable-multibyte \
    --prefix=/usr/local
    
    make
    make install
    ```
3. 检测
    ```sh
    vim --version
    # 截至20200301, 此方法最新版是8.2
    ```
  
注意:
1. python2和python3只能选择一个安装: 有些博客在configure那一步同时enable了python2和python3是有问题的(安装参考网址的说法), 这里选择了python3, 后面在youcompleteme中需要用python3, 并且python3是趋势, 所以这里选择python3. (如果要选择python2, 只需要把上面的python3改为python)
2. `with-python3-config-dir`: 这个的查看方式是: 命令行`python --version`, 我的是3.6, 所以就在`/usr/lib/python3.6/`中去找类似`config-3.6m-x86_64-linux-gnu`这样名字的文件夹, 总之就是确保: python3版本和路径一致, 路径正确.

## 2. 源码编译安装llvm clang

参考网址: https://llvhttps://m.org/docs/GettingStarted.html#getting-started-with-llvm

1. 安装准备环境
    ```sh
    # clang的编译需要gcc等
    sudo apt install gcc
    sudo apt install g++
    sudo apt install make
    sudo apt install cmake 
    ```
2. 下载并编译
    ```sh
    git clone https://github.com/llvm/llvm-project.git
    cd llvm-project
    mkdir build
    cd build

    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ../llvm -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi;compiler-rt;clang-tools-extra;openmp;lldb;lld" 

    make -j2
    make install
    ```
3. 测试

    ```sh
    clang --version
    # 截至20200301最新版是11.0
    ```

注意:
1. `cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ../llvm`: 这一步不要改动
2. `DLLVM_ENABLE_PROJECTS`: 这里面选择要安装的选项, 分号分隔, 参看网址选择, 一般都选`clang;libcxx;libcxxabi;compiler-rt;clang-tools-extra`, 我怕后期又要装啥麻烦, 就又选了lldb(调试), lld(链接优化)

## 3. youcompleteme编译安装

参考网址: https://github.com/ycm-core/YouCompleteMe#linux-64-bit
建议不要用这个博客的方法: https://github.com/yangyangwithgnu/use_vim_as_ide

1. 安装插件管理器vundle
    ```sh
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    # 在 ~/.vimrc 增加相关配置信息

    " vundle 环境设置
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    " vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'ycm-core/YouCompleteMe'

    " 插件列表结束
    call vundle#end()
    filetype plugin indent on
    ```
2. 打开vim, 输入`:PluginInstall`, 下载YouCompleteMe
3. 安装
    ```sh
    # 依赖项
    sudo apt install build-essential cmake python3-dev
    cd ~/.vim/bundle/YouCompleteMe
    # 如果要选择其他语言支持可以选, 参考网址里有
    python install.py --clang-completer
    ```
4. 编辑文件在工程项目目录中新建`.ycm_extra_conf.py`,我们只需要改flags中头文件的目录即可,内容如下(此内容参考https://github.com/yangyangwithgnu/use_vim_as_ide):
    ```python
    import os 
    import ycm_core 
    flags = [ 
        '-std=c++11', 
        '-O0', 
        '-Werror', 
        '-Weverything', 
        '-Wno-documentation', 
        '-Wno-deprecated-declarations', 
        '-Wno-disabled-macro-expansion', 
        '-Wno-float-equal', 
        '-Wno-c++98-compat', 
        '-Wno-c++98-compat-pedantic', 
        '-Wno-global-constructors', 
        '-Wno-exit-time-destructors', 
        '-Wno-missing-prototypes', 
        '-Wno-padded', 
        '-Wno-old-style-cast',
        '-Wno-weak-vtables',
        '-x', 
        'c++', 
        '-I',
        '.',
        '-isystem', 
        '/usr/local/include/c++/v1/',
        '-isystem',
        '/usr/include/',
        '-isystem',
        '/usr/',
        '-isystem',
        '/usr/include/x86_64-linux-gnu/',
    ] 
    compilation_database_folder = '' 
    if compilation_database_folder: 
    database = ycm_core.CompilationDatabase( compilation_database_folder ) 
    else: 
    database = None 
    SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ] 
    def DirectoryOfThisScript(): 
    return os.path.dirname( os.path.abspath( __file__ ) ) 
    def MakeRelativePathsInFlagsAbsolute( flags, working_directory ): 
    if not working_directory: 
        return list( flags ) 
    new_flags = [] 
    make_next_absolute = False 
    path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ] 
    for flag in flags: 
        new_flag = flag 
        if make_next_absolute: 
        make_next_absolute = False 
        if not flag.startswith( '/' ): 
            new_flag = os.path.join( working_directory, flag ) 
        for path_flag in path_flags: 
        if flag == path_flag: 
            make_next_absolute = True 
            break 
        if flag.startswith( path_flag ): 
            path = flag[ len( path_flag ): ] 
            new_flag = path_flag + os.path.join( working_directory, path ) 
            break 
        if new_flag: 
        new_flags.append( new_flag ) 
    return new_flags 
    def IsHeaderFile( filename ): 
    extension = os.path.splitext( filename )[ 1 ] 
    return extension in [ '.h', '.hxx', '.hpp', '.hh' ] 
    def GetCompilationInfoForFile( filename ): 
    if IsHeaderFile( filename ): 
        basename = os.path.splitext( filename )[ 0 ] 
        for extension in SOURCE_EXTENSIONS: 
        replacement_file = basename + extension 
        if os.path.exists( replacement_file ): 
            compilation_info = database.GetCompilationInfoForFile( replacement_file ) 
            if compilation_info.compiler_flags_: 
            return compilation_info 
        return None 
    return database.GetCompilationInfoForFile( filename ) 
    def FlagsForFile( filename, **kwargs ): 
    if database: 
        compilation_info = GetCompilationInfoForFile( filename ) 
        if not compilation_info: 
        return None 
        final_flags = MakeRelativePathsInFlagsAbsolute( 
        compilation_info.compiler_flags_, 
        compilation_info.compiler_working_dir_ ) 
    else: 
        relative_to = DirectoryOfThisScript() 
        final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to ) 
    return { 
        'flags': final_flags, 
        'do_cache': True 
    }

    ```
    这个在 https://github.com/whuwzp/vim_config 中有保存
    
注意: 
1. `.ycm_extra_conf.py`中的头文件添加方法: 我安装clang是用默认的路径`/usr/local`,所以增加了`'-isystem', '/usr/local/include/c++/v1/'`
    - `'-isystem','/usr/include/'`: 这个是系统头文件
    - `'-isystem','/usr/'`: 这也是系统的
    - `'-isystem','/usr/include/x86_64-linux-gnu/'`:这个是linux的
2. 如果发现某个函数不能补全或者报错的解决方法
    先看看函数所属的头文件,然后在百度或者直接去/usr/include,等位置去找找, 然后添加到`.ycm_extra_conf.py`中, 例如`sys/socket.h`没有自动补全,百度发现在`/usr/include/x86_64-linux-gnu/`中, 然后在添加`'-isystem','/usr/include/x86_64-linux-gnu/'`即可
3. 强烈建议**不要复制头文件到/usr/include**
    这样图一时方便,但全都混乱了,就用上一步的方法最好,也便于自己理解各头文件的位置
4. ycm server shutdown的解决方法
    需要进入`~/.vim/bundle/youcompleteme`目录下,install,具体如下:
    ```sh
    # 如果不执行这一步,下一步就报错
    git submodule update --init --recursive
    # 然后install
    sudo ./install.sh --clang-completer
    # 如果上一步报错缺少regex或者cregex,那就是git submodule update --init --recursive没有完全下载,那就去目录下找,例如我的是regex,到youcompleteme的github下找到了thrid/ycmd/third/regex,然后发现子项目的地址https://github.com/ycm-core/regex.git,然后自己git clone下来,手动拷贝到那个目录就好,例如git clone https://github.com/ycm-core/regex.git
    ```   
 5. 不能补全另一个文件中自定义的类
    YCM 只在如下两种场景下触发语义补全：一是补全标识符所在文件必须在 buffer 中（即，文件已打开）；一是在对象后键入 .、指针后键入 ->、名字空间后键入 ::。
    所以必须打开那个文件才行.
6. 如果没有boost
    那就自己下载安装boost
    以下参照: https://www.cnblogs.com/smallredness/p/9245127.html
    ```
    解压到一个目录
    tar -zxvf boost_1_66_0.tar.gz
    1、正常编译：
    进入boost_1_66_0目录中
    cd boost_1_66_0
    ./bootstrap.sh --with-libraries=all --with-toolset=gcc
    --with-liraries：需要编译的库
    --with-toolset：编译时使用的编译器
    安装boost库
    ./b2 install --prefix=/usr
    ```
7. 编译警告可以参见：https://blog.csdn.net/qq_17308321/article/details/79979514

## 4. 插件

主要是c++相关的. `~/.vimrc`文件在GitHub上有:https://github.com/whuwzp/vim_config
以下内容参考: https://github.com/yangyangwithgnu/use_vim_as_ide

### 4.1 vundle插件管理器

```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
1. 在 .vimrc 增加相关配置信息
    
    ```sh

    " vundle 环境设置
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    " vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'dyng/ctrlsf.vim'

    " 插件列表结束
    call vundle#end()
    filetype plugin indent on

    ```
    其中，每项`Plugin 'dyng/ctrlsf.vim'`，对应一个插件（这与 go 语言管理不同代码库的机制类似），后续若有新增插件，只需追加至该列表中即可。

2. 安装插件: 
    先找到其在 github.com 的地址，再将配置信息其加入 .vimrc 中的call vundle#begin() 和 call vundle#end() 之间，如`Plugin 'dyng/ctrlsf.vim'`, 最后进入 vim 执行`:PluginInstall`
3. 删除插件
    要卸载插件，先在 .vimrc 中注释或者删除对应插件配置信息，然后在 vim 中执行:`:PluginClean`即可删除对应插件。
3. 更新插件
    更新频率较高，差不多每隔一个月你应该看看哪些插件有推出新版本，批量更新，只需执行`:PluginUpdate`。

### 4.2 补全类插件

```
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'SirVer/ultisnips'
```

#### 4.2.1 YouCompleteMe语义补全

安装参见上面. 以下是配置:

```
" Youcompleteme                                    语义补全
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
" set tags+=/usr/include/c++/7/stdcpp.tags, 我只使用clang中的就好
set tags+=/usr/local/include/c++/v1/clang.tags
" set tags+=/usr/include/sys.tags,这个太大了了
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全           
let g:ycm_seed_identifiers_with_syntax=1
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
" 设置用于关闭补全列表的快捷键，默认为ctrl+y, 改为了;'
let g:ycm_key_list_stop_completion = ["<leader>'"]
```

#### 4.2.2 vim-protodef接口实现补全

**配置**

在h中声明,然后cpp中用插件帮我们生成实现函数的壳子.

```
Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'

" 设置 pullproto.pl 脚本路径
" 原博客是这个,但是我的路径是vim-protodef,所以改了
" let g:protodefprotogetter='~/.vim/bundle/protodef/pullproto.pl'
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
```

使用示例:
1. 编辑h文件
    ```c++
    class MyClass 
    {
        public:
            void printMsg (int = 16);
            virtual int getSize (void) const;
            virtual void doNothing (void) const = 0;
            virtual ~MyClass ();
        private:
            int num_;
    };
    ```
2. 新建同名cpp文件
    用快捷键<leader>P, 我们的设定是`;P`即可生成如下内容:
    ```c++
    int MyClass::getSize(void) const
    {
        return 0;
    }

    void MyClass::youprint(int)
    {
    }

    MyClass::~MyClass()
    {
    }
    ```

- 优点一: **virtual、默认参数**等应在函数声明而不应在函数定义中出现的关键字，protodef 已为你过滤；
- 优点二：doNothing() 这类**纯虚函数**不应有实现的自动被 protodef 忽略


**使用**
在h中定义class,然后新建同名cpp, 用快捷键`<leader>PP`,我的是`;PP`生成对应cpp内容.

#### 4.2.3 ultisnips模板补全

**配置**
" SirVer/ultisnips                                模板补全
" mysnippets默认路径: ~/.vim/bundle/ultisnips/mysnippets/cpp.snippets
let g:UltiSnipsSnippetDirectories=["~/.mysnippets"]
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

注意: 编辑`~/.mysnippets/cpp.snippets`可以修改模板,改到这个位置,相当于程序和配置分离,这样可以方便推送到GitHub上保存,换个环境也可以直接用了

**使用**
按照博客设置即可, 按`;<tab>`就可以, 再按一次就可以跳到下一个位置, 例如if(1){2}.
按照该博客的设置,有如下快捷:
- `INC`: #include""
- `inc`: #include<>
- `if`: if语句
- `ei`: else if语句
- `el`: else 语句
- `re`: return
- `do`: do while语句
- `wh`: while语句
- `sw`: switch语句
- `for`: for语句(大小写for组合出多种场景,试试)
- ` `: try catch
- `set` `map` `lst` `vec`: 试试就知道了,对应容器的
- `cl`: class
- `b`: ()
- `st`: []
- `br`: {}
- `q`: ""
- `se`: ''
- `ar`: ->, 这个是arrow

剩下的感觉效果不大这里不记了.

注意：`snippet b "bracket" I`这里的I表示只有遇到整词b才会补全,printfb这样的就不会, 如果改成i就会遇到b字符就补全

### 4.3 主题颜色类

``` 
Plugin 'vim-airline/vim-airline'                                      
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'
```

#### 4.3.1 vim-airline和vim-airline-themes

**配置**
```
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'
```

#### 4.3.2 molokai
**配置**
```
set background=dark
set t_Co=256
colorscheme molokai
```

### 4.4 代码高亮注释格式化类

```
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'crooloose/nerdcommenter'
Plugin 'vim-clang-format'
```

#### 4.4.1 vim-cpp-enhanced-highlight高亮


``` 
" vim-cpp-enhanced-highlight                        cpp语法高亮
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1 
let g:cpp_experimental_simple_template_highlight = 1
syntax keyword cppSTLtype initializer_list
```

注意: 需要确保以下内容:
    ```
    " 开启文件类型侦测
    filetype on
    " 根据侦测到的不同类型加载对应的插件
    filetype plugin on
    ```


#### 4.4.2 vim-indent-guides缩进
```
" vim-indent-guides                                   缩进显示                                                         
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
```

#### 4.4.3 clang-format 格式化
```
"clang-format                                          代码风格格式化
" map to <Leader>cf in C++ code
" 可以在~/.clang-format中编辑更加详细的设置
set ts=4
" 退出insert模式时自动格式化, 如果加了这个那么ultisnip插件就会受影响,因为模板补全后会由insert变为select,这样会同时触发clang-format和ultisnip 
" let g:clang_format#auto_format_on_insert_leave=1
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
```

注意: 
1. 需要安装 clang-format
    ```sh
    apt install clang-format
    ```
2. 可以新建`~/.clang-format`具体配置格式, 参考文件保存在: https://github.com/whuwzp/vim_config 

#### 4.4.4  nerdcommenter代码注释

```
" 默认<leader>cc, <leader>cu
```

### 4.5 内容搜索替换

```
Plugin 'dyng/ctrlsf.vim' 
Plugin 'mileszs/ack.vim'
Plugin 'yegappan/grep'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Yggdroot/LeaderF'
```


#### 4.5.1 vim-multiple-cursors多选

```
" vim-multiple-cursors                          选中多选
" 默认是ctrl+N,这里不修改
" let g:multi_cursor_next_key='<S-n>'
" let g:multi_cursor_skip_key='<S-k>'
```

我想将 prtHelpInfo() 集体更名为 showHelpInfo()，先通过 ctrlsf 找到工程中所有 prtHelpInfo，然后直接在 ctrlsf 子窗口中选中第一个 ptr，再通过 vim-multiple-cursors 选中第二个 ptr(在子窗口按`CTRL+n`选中下一个)，然后ESC, insert, 进入编辑模式, 接着统一删除 ptr 并统一键入 show，最后保存并重新加载替换后的文件(:wq, Y, L)。

#### 4.5.2 ctrlsf.vim查找

```
" ctrlsf.vim                                      搜索               
" 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
noremap <Leader>sp :CtrlSF<CR>
```
注意: 需要安装grep-ack工具
    ```
    sudo apt install grep-ack
    ```

### 4.6 ctags标签书签相关

```
" ctags标签书签相关
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'kshenoy/vim-signature'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'
```

注意:需要安装ctags, `sudo apt install ctags`

原理是在工程目录下生成名为tags的文件，根据该文件跳转。

1. 安装
    ```
    sudo apt install ctags
    ```
2. 生成tags文件
    ```
    cd /data/workplace/example/
    ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++
    ```
    这个命令就是生成tags文件，还有很多，参照：https://blog.csdn.net/foreverling/article/details/80329586
    然后让vim知道tags路径,在vim命令模式下输入:
    ```
    :set tags+=/data/workplace/example/tags
    ```
3. 使用
    先要在vim命令模式中加上面的那句.
    - CTRL+]: 向前跳转,跳到定义处
    - CTRL+t: 向后跳转
    - g]: 查找函数等的定义(go), 会罗列几个,输入数字选择
    - ;tn: 正向遍历同名标签
    - ;tp: 反向遍历同名标签

以下是为tn和tp设置的快捷键:
```
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>
```

#### 4.6.1 indexer自动更新标签

用这个就不用手动生成更新tags文件了.

``` 
" 修改ctags生成tags文件的参数
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
```

注意: indexer 还要自己的配置文件，用于设定各个工程的根目录路径，配置文件位于 `~/.indexer_files`，内容可以设定为：
    ```
    --------------- ~/.indexer_files ---------------  
    [foo] 
    /data/workplace/foo/src/
    [bar] 
    /data/workplace/bar/src/
    ```
    只有添加了目录才会自动生成更新tags文件(buffer中的估计是,没有落地成文件).

注意: 必须用全路径,万万不要用`~/test/`,要用`/home/username/test/`

#### 4.6.2 tagbar标签栏

```
" tagbar                                              标签窗口
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：tag bar
nnoremap <Leader>tb :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=16
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 自动设置焦点在tagbar
let g:tagbar_autofocus = 1 
" 设置自动打开tagbar
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()                          
```

za,zr,zm和之前的折叠展开一样, 快捷键如下, 参照: http://aiezu.com/article/linux_vim_golang_tagbar_nerdtree.html


常用命令
- 回车: 转到标签定义处，并且光标跳转到标签定义处；
- p: 转到标签定义处，但光标停留在Tagbar的窗口；
- P: 在预览窗口显示标签；
- <C-N>: 跳到下一个上级标签；
- <C-P>: 跳到上一个上级标签；
- <Space>: 显示标签定义；


#### 4.6.3 signature书签收藏
```
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
```

常用命令:
- mx:设定/取消当前行名为 x 的标签
- m,: 自动设定下一个可用书签名
- mn: 跳转到下一个书签
- mp: 跳转至上一个书签
- mda: 删除所有的书签,marks del all

#### 4.6.4 LeaderF 文档和buffer搜索

> 注意: 由于leaderf在一个目录查找后就会把那个目录当作当前默认目录,所以一旦在其他目录查找了, 就很难切回来, 改进的是:这里的`%:h`是表示当前文件的目录路径

```
" 在当前目录查找
nnoremap <leader>fl :LeaderfFile %:h<cr>
" 在当前用户目录查找
nnoremap <leader>fu :LeaderfFile ~<cr>
" 自定义查找位置, 可以输入../之类的
nnoremap <leader>fc :LeaderfFile 

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
" 排除文件
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git'],
            \ 'file': ['*.bak','*.a','*.o','*.so']
            \}
```

- `;f`: 查找文件
- `;b`: 查找buffer

### 4.7 结对符相关

```
Plugin 'gcmt/wildfire.vim'
Plugin 'tpope/vim-surround'
```

#### 4.7.1 wildfire.vim结对符内容选中

" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <leader><SPACE> <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]

我只需按下空格（normal模式下），自动选中光标所在区域最近的一层结对符内的文本，如果没有结对符，则选择最近的一个段落。

使用:
- `<space>`:在normal模式下(因为是nmap)空格,选中第一层,多按几次就选上一层
- `;<space>`:取消选中(原博客是<S-SPACE>),但是估计是shift+space这个快捷键被占用了

#### 4.7.2 vim-surround选中内容加结对符

```
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
```

选中内容,然后按自己想要的结对符即可.

### 4.8 其他

Plugin 'derekwyatt/vim-fswitch'
Plugin 'scrooloose/nerdtree'

#### 4.8.1 vim-fswitch在h和cpp中切换

```
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>
```

初始状态先打开了接口文件 MyClass.h，键入 ;sw 后，vim 在新 buffer 中打开实现文件 MyClass.cpp，并在当前窗口中显示；再次键入 ;sw 后，当前窗口切回接口文件。 

#### 4.8.2 nerdtree项目文档查看

> 介于LeaderF功能和展示都比较方便好, 已经不再使用nerdtree, 用LeaderF代替, nerdtree的一大缺点是占用了buffer,给buffer切换带来麻烦.

```
Plugin 'scrooloose/nerdtree'
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 以下是新加的,在nerdtree github说明中找到的,设置成vim启动自动打开列表
autocmd vimenter * NERDTree
```

常用命令:
键入 <leader>fl 后，右边子窗口为工程项目文件列表,其他使用如下:
- 回车:打开选中文件
- r:刷新工程目录文件列表
- I（大写）:显示/隐藏隐藏文件
- m: 出现创建/删除/剪切/拷贝操作列表


## 5. 使用

### 5.1 快捷键及设置

#### 5.1.1 光标移动

- `w`           :  正向移动到相邻单词的首字符
- `b`           :  逆向移动到相邻单词的首字符
- `e`           :  正向移动到相邻单词的尾字符
- `ge`          :  逆向移动到相邻单词的尾字符
- `fa`          :  正向移动到第一个字符 a 处
- `Fa`          :  逆向移动到第一个字符 a 处
- `8w`          :  正向移动到相隔八个单词的首字符执行
- `4Fa`         :  逆向移动到第四个 a 字符处
- `0`           : 行尾
- `$`           : 行首
- `gg`          : 跳转到文件头
- `Shift+g`     : 跳转到文件末尾

#### 5.1.2 编辑操作

- `u`           : 撤销上一步的操作
- `Ctrl+r`      : 恢复上一步被撤销的操作
- `CTRL+s`      : 锁死
- `Ctrl+Q`      : 来解除锁死

#### 5.1.3 窗口移动

CTRL+w即可, 上述的tagbar和搜索的窗口相互切换.

- `;wh`         : 向左切换窗口
- `;wj`         : 向下切换窗口
- `;wk`         : 向上切换窗口
- `;wl`         : 向右切换窗口


### 5.2 折叠代码

```
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
```
操作：za，打开或关闭当前折叠；zm，关闭所有折叠；zr，打开所有折叠。

### 5.3 高亮同名词

- `gd`          : 高亮显示所有相同的单词
- `shift + "*"` : 向下查找相同单词并高亮显示
- `shift + "#"` : 向上查找相同单词并高亮显示
- `:noh`        : 命令行模式下输出：“noh” 命令取消高亮显示

```
" 取消高亮单词
nnoremap <leader>no :noh<CR>
```

### 5.4 替换

1. 你也可以指定行范围，如，第三行到第五行的my替换为your,flag是是否确认.
    ```
    :3,5s/my/your/[flags]
    ```
2. 选中内容替换
    先进入visual模式选中,然后输入`:`, 之后系统默认变为`:'<,'>`,所以我们只需要再输入:
    ```
    s/my/your/[flags]
    ```
3. 如果对工程内所有文件进行替换，先 `:args **/.cpp **/.h` 告知 vim 范围，再执行替换.
 


### 5.5 环境保护

请确保你的 vim 支持这两个特性：
```
vim --version | grep mksession
vim --version | grep viminfo

" 设置环境保存项
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存 undo 历史
set undodir=~/.undo_history/
set undofile
" 保存快捷键
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" 恢复快捷键
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
```

使用:
- `;ss`: 保护环境
- `;rs`: 还原环境
  
### 5.6 编译执行

1. txt编辑不多说
2. makefile: vim 内部通过 ! 前缀可以执行 shell 命令，:!cmake CMakeLists.txt
3. 设定快捷键, `;m`,即make 


删除main程序,重新编译.
```
nmap <Leader>make :!rm -rf main<CR>:wa<CR>:make<CR><CR>:cw<CR>
```
 
CMakeLists.txt文件内容, 编译选项详见: https://www.jianshu.com/p/cbd1f2e52542

```
PROJECT(main) 
SET(SRC_LIST server.cpp) 
SET(CMAKE_CXX_COMPILER "clang++") 
SET(CMAKE_CXX_FLAGS "-std=c++11 -stdlib=libc++ -Werror -Weverything -Wno-deprecated-declarations -Wno-disabled-macro-expansion -Wno-float-equal -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-global-constructors -Wno-exit-time-destructors -Wno-missing-prototypes -Wno-padded -Wno-old-style-cast -Wno-unreachable-code")
SET(CMAKE_EXE_LINKER_FLAGS "-lc++ -lc++abi") 
SET(CMAKE_BUILD_TYPE Debug) 
ADD_EXECUTABLE(server ${SRC_LIST})

```

### 5.7 窗口尺寸修改

- 如果是水平分隔可以使用:nwinc +/-把当前激活窗口高度增加、减少n个字符高度，比如:10winc +
- 如果是垂直分隔可以使用:nwinc >/<把当前激活窗口宽度增加、减少n个字符宽度，比如:5winc >

### 5.8 纯本文复制

摘自链接：https://blog.csdn.net/Liu_jalon/article/details/88657513

我们经常会遇到再linux vim编辑器中复制粘贴代码时出现格式错乱的问题，这会影响我们工作的效率，下面介绍一种解决这种问题的办法：
运行如下命令，进入 paste 模式：`:set paste`
进入 paste 模式后，按 i 键进入插入模式，然后再粘帖，文本格式不会错乱了。但粘帖后还需要按 <ESC> 进入普通模式并执行如下命令结束 paste 模式:`:set nopaste`。

```
" 设置纯文本复制粘贴
map <F9> :set paste<CR>i
map <F10> :set nopaste<CR>
```


### 5.9 系统剪切板

vimrc中增加以下:
```
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
```

以下摘自:https://blog.csdn.net/u014104588/article/details/81071479
引发问题出现的原因是～/.viminfo拥有者为root，因此执行以下命令将~/.viminfo拥有者更改为当前用户。
```sh
# 把username改为自己的用户名
sudo chown username ~/.viminfo 
```

 
### 5.10 man支持

1. 安装
    以下直接摘自博客:

    要使用该功能，系统中必须先安装对应 man。安装 linux 系统函数 man，先下载（https://www.kernel.org/doc/man-pages/download.html ），解压后将 man1/ 至 man8/ 拷贝至 /usr/share/man/，运行 man fork 确认是否安装成功。安装 C++ 标准库 man，先下载（ftp://GCC.gnu.org/pub/GCC/libstdc++/doxygen/ ），选择最新 libstdc++-api-X.X.X.man.tar.bz2，解压后将 man3/ 拷贝至 /usr/share/man/，运行 man std::vector 确认是否安装成功.

    > https://www.cnblogs.com/lymboy/p/8143569.html, 中直接找到了IP,以免解析不了, http://216.165.129.141/pub/sourceware.org/libstdc++/doxygen/
2. 使用
    - `:Man fork`: 手动输入
    - `;man`: 光标所在单词将被传递给 :Man 命令，不用再手工键入.
 
  
