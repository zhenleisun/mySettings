
"""""" vim settings """""""
set nocompatible              " required
set tabstop=2                 " tab length
set shiftwidth=2              " 缩进长度
set showmatch                 "显示匹配的括号"
set backspace=2
set hlsearch                  "highlight search
set number
set noic						  				" ignore case

" quick key settings
let mapleader = "\<Space>"

nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>q! :q!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>run :!time python %<CR>
nnoremap <leader>paste :set paste <CR>
nnoremap <leader>np :set nopaste <CR>


" Vundle settings 
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/syntastic'      " syntastic
Plugin 'terryma/vim-expand-region' " quick way to do the selection
Plugin 'ctrlpvim/ctrlp.vim'   " ctrl p open the file
Plugin 'jiangmiao/auto-pairs' " add the parenthsis pairs
Plugin 'davidhalter/jedi-vim' " python auto compeletion

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"""" you complete me """"""
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf = '/Users/zhenlei_sun/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" for ycms
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>

" for terryma/vim-expand-region setting
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


" python settings 
"按F5运行python"
map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
  let mp = &makeprg
  let ef = &errorformat
  let exeFile = expand("%:t")
  setlocal makeprg=python\ -u
  set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  silent make %
  copen
  let &makeprg = mp
  let &errorformat = ef
endfunction

let python_highlight_all=1 " 高亮所有Python语法
syntax on
