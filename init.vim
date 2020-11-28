source $HOME/.config/nvim/plug-config/coc.vim
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc 

set title  " Muestra el nombre del archivo en la ventana de la terminal
set number  " Muestra los números de las líneas
set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)
set rnu "Relative number

set nowrap  " No dividir la línea si es muy larga

set cursorline  " Resalta la línea actual
set colorcolumn=120  " Muestra la columna límite a 120 caracteres

" Indentación a 2 espacios
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s

set hidden  " Permitir cambiar de buffers sin tener que guardarlos

set ignorecase  " Ignorar mayúsculas al hacer una búsqueda
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas

set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español

set termguicolors  " Activa true colors en la terminal
let mapleader = ' ' 

" CONFIGURACION DE MODULOS
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'kevinoid/vim-jsonc'
Plug 'puremourning/vimspector'
Plug 'sbdchd/neoformat' "format source code
Plug 'davidhalter/jedi-vim' "GO-TO PLUGIN, CAN BE code autocompletiON
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake' "Code syntax check and build automation for Nvim
Plug 'jiangmiao/auto-pairs' "Autogruvboxgruvboxmatic quote and bracket completion
Plug 'tpope/vim-fugitive'
Plug 'anotherproksy/ez-window'
Plug 'Yggdroot/indentLine'

"Plug 'cjrh/vim-conda'
call plug#end()
let g:python3_host_prog= '/home/ainon/anaconda3/bin/python3'
let g:deoplete#enable_at_startup = 0
""vim-conda"
"map <F4> :CondaChangeEnv<CR>
""""""""""""VIMSPECTOR 
let g:vimspector_enable_mappings = 'HUMAN'
""""""""""""
""NEOFORMAT"
let g:neoformat_basic_format_align = 1 "Enable alignment"
let g:neoformat_basic_format_retab = 1 " Enable tab to space conversion
let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace
"JEDIVIM"
let g:jedi#completions_enabled = 0 " disable autoconnmpletion, because we use deoplete for completion
let g:jedi#use_splits_not_buffers = "right" " open the go-to function in split, not another buffer

colorscheme gruvbox
set background=dark

if (has("termguicolors"))
    set termguicolors
endif

lua require 'colorizer'.setup()

"NERDTreeComenter
nmap <C-_> <Plug>NERDCommenterToggle
nmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
nmap <F2> :NERDTreeToggle<CR>

" Tabs
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
"let g:airline#extensions#tabline#formatter = 'default'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-w> :bd<CR>

nnoremap <leader>h :split<CR>=expand('%:p')
nnoremap <leader>j :vsplit<CR>=expand('%:p')

"nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" end Tabs
" Snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand) 
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select) 
let g:coc_snippet_next = '<c-j>' " Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>' " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
imap <C-j> <Plug>(coc-snippets-expand-jump) " Use <C-j> for both expand and jump (make expand higher priority.)

" end Snippets
" Python Config
let g:neomake_python_enabled_markers= ['pylint']
call neomake#configure#automake('nrwi', 500)
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
" End Ptython Config
""Identation"
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

