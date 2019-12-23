call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'neomake/neomake'
call plug#end()
call deoplete#enable()
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set completeopt-=preview
let g:deoplete#auto_complete_delay=1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/3.8.1/include'
" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
call neomake#configure#automake('w')
let g:neomake_python_flake8_maker = { 'args' : []}
let g:neomake_python_enabled_makers = ['flake8']

function! neomake#makers#ft#javascript#EnabledMakers() abort
    return ['jshint', 'jscs',
                \ executable('eslint_d') ? 'eslint_d' : 'eslint',
                \]
endfunction

syntax on
set relativenumber
set number
set autoindent
set hidden

let mapleader="ù"
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap <leader>( (
inoremap <leader>[ [
inoremap <leader>" "
inoremap <leader>' '
inoremap <C-L> <right>
inoremap <leader><leader> <Esc>
inoremap <Esc> <nop>
nnoremap <C-P> 5k
nnoremap <C-N> 5j
cnoremap rb rightbelow
vnoremap <leader>" <Esc>`>a"<Esc>`<i"<Esc>
vnoremap <leader>' <Esc>`>a'<Esc>`<i'<Esc>
vnoremap <leader>( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap <leader>[ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap <leader>c <Esc>`>a*/<Esc>`<i/*<Esc>

autocmd FileType text,tex,vim iunmap '

autocmd FileType python setlocal shiftwidth=4 softtabstop=0
autocmd FileType php setlocal noexpandtab shiftwidth=4 softtabstop=0
autocmd FileType c setlocal shiftwidth=4

"Snippets
"C Snippets
augroup Csnippet
	autocmd!
	autocmd FileType c inoremap main<Tab> int<Space>main(int<Space>argc,char<Space>**argv)<Esc>o{}<Esc>i<Enter><Esc>koreturn<Space>EXIT_SUCCESS;<Esc>O
	autocmd FileType c inoremap for8<Tab> for(uint8_t i=0;i<Space><;i++)<Esc>o{}<Esc>i<Enter><Esc>ko<Esc>kkf<a 
	autocmd FileType c inoremap for6<Tab> for(uint16_t i=0;i<Space><;i++)<Esc>o{}<Esc>i<Enter><Esc>ko<Esc>kkf<a 
	autocmd FileType c inoremap for2<Tab> for(uint32_t i=0;i<Space><;i++)<Esc>o{}<Esc>i<Enter><Esc>ko<Esc>kkf<a 
	autocmd FileType c inoremap for4<Tab> for(uint64_t i=0;i<Space><;i++)<Esc>o{}<Esc>i<Enter><Esc>ko<Esc>kkf<a 
	autocmd FileType c inoremap struct<Tab> typedef<Space>struct<Esc>o{}<Esc>i<Enter><Esc>ko<Esc>ja;<Esc>i
augroup END

augroup AccoladesProg
	autocmd!
	autocmd FileType c,cpp,php,java,javascript inoremap { {}<Esc>i<Enter><Esc>ko
augroup END

augroup AccoladesElse 
	autocmd!
	autocmd FileType plaintex inoremap { {}<Esc>i
augroup END
