set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" 110列超长提示
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

execute pathogen#infect()
syntax on
filetype plugin indent on
set t_Co=256

" syntastic start
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ycm_show_diagnostics_ui = 0
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = "gcc"
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
" syntastic end

" nerdtree start
" autocmd vimenter * NERDTree " 打开vim时，自动启动nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " 关闭文件时自动关闭nerdtree
" ctrl+n 打开或者关闭nerdtree
map <C-n> :NERDTreeToggle<CR>
" nerdtree end

" ultisnips start
" ultisnips end

" YCM start
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
" YCM end

" airline start
let g:airline_theme='deus'
" airline end
