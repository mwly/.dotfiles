"######################################################### Settings
syntax on
set ruler
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set wrap linebreak
"---set wrap exclusions
" autocmd FileType markdown set nowrap
autocmd FileType gprof set nowrap

set nohlsearch
set incsearch
set termguicolors

set smartcase
set backspace=indent,eol,start
set updatetime=300
set cmdheight=2
set noswapfile
set nobackup
set scrolloff=8
set undodir=~/.vim/undodir
set undofile
set signcolumn=yes

highlight LineNr ctermfg=11

"----Spell checking--
setlocal spelllang=de
autocmd FileType markdown setlocal spell


"######################################################### KEYMAP Vim----
let mapleader = " "

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"window REsize at  bottom of file


nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
map <f9> :w <CR> :make!<CR>

"open Terminal
nmap <leader>tr :vsplit<CR><C-l>:terminal<CR>
nmap <leader>tu :belowright split<CR><C-j>:terminal<CR>
"exit Terminal mode
tnoremap <Esc> <C-\><C-n>
tmap <C-h> <ESC><C-w>h
tmap <C-j> <ESC><C-w>j
tmap <C-k> <ESC><C-w>k
tmap <C-l> <ESC><C-w>l

" move marked line
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

nnoremap Q <nop>

"find replace all instances of hovered word in buffer
nnoremap <leader>/ :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" make current file xctbl
nnoremap <leader>x :!chmod +x %<CR>



"######################################################### Plugins
"using vim-Plug
set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin('~/.config/nvim/plugged')
"-- essentials
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'

" visibility
Plug 'ggandor/leap.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'preservim/nerdtree'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mbbill/undotree'
Plug 'Chiel92/vim-autoformat'
" Plug 'honza/vim-snippets'

"colorschemes
Plug 'morhetz/gruvbox'
Plug 'wadackel/vim-dogrun'


"languages
Plug 'lervag/vimtex'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" fun
Plug 'eandrju/cellular-automaton.nvim'

"-- performance bullshit for extension dev
Plug 'nvim-lua/plenary.nvim'

call plug#end()            " required
filetype plugin indent on    " required

"######################################################### Plugin-general
"----enable colorscheme
"colorscheme dogrun
colorscheme gruvbox
command GetJinxed colorscheme dogrun
command CalmDown colorscheme gruvbox

"screensavers
nnoremap <leader><ESC> :CellularAutomaton make_it_rain<CR>
nnoremap <leader><leader><ESC> :CellularAutomaton game_of_life<CR>

"----UndoTree-----
nnoremap <F5> :UndotreeToggle<CR>

"----Telescope----
" Find files using Telescope command-line sugar.
nnoremap <leader>fb <cmd>Telescope find_files cwd=~ --hidden prompt_prefix=🔍<cr>
nnoremap <leader>fg <cmd>Telescope live_grep prompt_prefix=🔍<cr>
nnoremap <leader>ff <cmd>Telescope git_files prompt_prefix=🔍<cr>
nnoremap <leader>fh <cmd>Telescope help_tags prompt_prefix=🔍<cr>

"----vimwiki----
let g:vimwiki_list = [{'path': '~/vimwiki/','syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_markdown_link_ext = 1

"----Nerdtree----
nnoremap <leader>n :NERDTree<CR>
let NERDTreeShowHidden=1

" -- uncomment to open nerdtree when opening vim
" autocmd VimEnter * NERDTree
" -- uncomment to open nerdtree, when buffer = Dir
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fugitive
nnoremap <leader>gg :Git<CR>

"---- leap require default settings---
"s leap forward
"S leap backwards
"gs leap across windows
lua require('leap').add_default_mappings()

"----Autoformat--
nnoremap <leader>a :Autoformat<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"----vim-go
"run in horizontal split
nmap <leader>gr <Plug>(go-run-split)
"show godocs in vertival split
nmap <leader>gd <Plug>(go-doc-vertical)
"show source definition in vertical split
"enabled 'g:go_def_reuse_buffer' to overwrite when you issue a recursive call
let g:go_def_reuse_buffer = 1
nmap <leader>gs <Plug>(go-def-vertical)
"show definition of type in vertical split
nmap <leader>gt <Plug>(go-def-type-vertical)

"show interfaces implemented by the hovered type
nmap <leader>gi <Plug>(go-implements)
"enable some extra highlighting
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1

"--- vimtex
"
"filetype plugin indent on    "already enabled
"
syntax enable

" viewer method:
let g:vimtex_view_method = 'zathura'
let g:vimtex_mappings_prefix = '<leader>b'





"######################################################### ----- COC----
inoremap <silent><expr><TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


inoremap <silent><expr><CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" activate ltex
let g:coc_filetype_map = {'tex': 'latex'}


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" let g:coc_snippet_next = '<tab>'
 
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Codeaction
nmap <leader>c  <Plug>(coc-codeaction)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

"----Coc-Plugin-shortcuts
"Python

nmap <leader>pr :CocCommand python.execInTerminal<CR>


"--Rust
nmap <leader>rr :CocCommand rust-analyzer.run<CR>


"window resizers
nnoremap <C-up> <C-w>+
nnoremap <C-down> <C-w>-
nnoremap <C-left> <C-w>>
nnoremap <C-right> <C-w><
