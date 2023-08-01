set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set smartindent
set relativenumber
set nu
set scrolloff=7

let mapleader = "\\"

autocmd FileType scala setlocal shiftwidth=2 tabstop=2

syntax on
au BufRead,BufNewFile *.pl set filetype=prolog

set path+=*/**

"Move // comment to prev line
let @a = "$2F/DO\<Esc>p=="

"Comment line
let @c = ":s/^/\\/\\/ /\<cr>"

let g:go_list_type = "quickfix"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 1
set updatetime=100
set autowrite

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

"Disable folding for vim-markdown
let g:vim_markdown_folding_disabled = 1

"map ctrl P to fzf
nnoremap <C-p> :Files<CR>

"map ctrl backspace to delete the prev word
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

"nvim telesope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"S for stamp, i.e. paste without overwriting the paste register
nnoremap <leader>S diw"0P

set nofoldenable

call plug#begin()
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'edwinb/idris2-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/vim-markdown'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-abolish'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'Aflynn50/NeoSolarized'
Plug 'romainl/vim-cool'
call plug#end()

set termguicolors
syntax enable
let g:airline_theme='solarized'
set background=light
colorscheme NeoSolarized
