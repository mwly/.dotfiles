syntax on
set ruler
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set wrap
"---set wrap exclusions
autocmd FileType markdown set nowrap
autocmd FileType gprof set nowrap

set smartcase
set incsearch
set backspace=indent,eol,start
set updatetime=300
set cmdheight=2
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set signcolumn=yes

highlight LineNr ctermfg=11

"----KEYMAP Vim----
let mapleader = " "
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l



nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
map <f9> :w <CR> :make!<CR>

"open Terminal
nmap <leader>tr :vsplit<CR><C-l>:terminal<CR>
nmap <leader>tu :belowright split<CR><C-j>:terminal<CR>
"exit Terminal mode
tnoremap <Esc> <C-\><C-n>

"----Spell checking--
setlocal spelllang=de
autocmd FileType markdown setlocal spell



"using vim-Plug
set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'Chiel92/vim-autoformat'
Plug 'vimwiki/vimwiki'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'https://github.com/sirtaj/vim-openscad'
Plug 'lervag/vimtex'
" Plug 'honza/vim-snippets'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mbbill/undotree'
" Plug 'untitled-ai/jupyter_ascending.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'ggandor/leap.nvim'

"colorschemes
Plug 'wadackel/vim-dogrun'
Plug 'morhetz/gruvbox'

call plug#end()            " required
filetype plugin indent on    " required


"----enable colorscheme
"colorscheme dogrun
colorscheme gruvbox
command GetJinxed colorscheme dogrun
command CalmDown colorscheme gruvbox

"----UndoTree-----
nnoremap <F5> :UndotreeToggle<CR>
"----Telescope----
" Find files using Telescope command-line sugar.
nnoremap <leader>fb <cmd>Telescope find_files cwd=~ prompt_prefix=🔍<cr>
nnoremap <leader>ff <cmd>Telescope live_grep prompt_prefix=🔍<cr>
nnoremap <leader>fg <cmd>Telescope git_files prompt_prefix=🔍<cr>
nnoremap <leader>fh <cmd>Telescope help_tags prompt_prefix=🔍<cr>

"----vimwiki----
let g:vimwiki_list = [{'path': '~/vimwiki/','syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_markdown_link_ext = 1

"----Nerdtree----
nnoremap <leader>n :NERDTree<CR>
let NERDTreeShowHidden=1

autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"----Autoformat--
nnoremap <leader>a :Autoformat<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


"----COC----
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"



inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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


"--Rust
nmap <leader>rr :CocCommand rust-analyzer.run<CR>

"--- vimtex
"
"filetype plugin indent on    "already enabled
"
syntax enable
" viewer method:
let g:vimtex_view_method = 'zathura'






"---- leap require default settings---
"s leap forward
"S leap backwards
"gs leap across windows
lua require('leap').add_default_mappings()

