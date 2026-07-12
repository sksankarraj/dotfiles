let mapleader = " "

nnoremap <leader>h :nohl<CR>

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

inoremap <Left> <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up> <ESC>:echoe "Use k"<CR>
inoremap <Down> <ESC>:echoe "Use j"<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap Q <nop>

nnoremap <C-f> :silent !tmux neww tmux-sessionizer<CR>

nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz

nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>x :!chmod +x %<CR>
nnoremap <leader>ds <C-W><C-D>

nnoremap <leader>al ggVG
nnoremap <leader>all ggVGy
nnoremap <leader><ESC> :noh<CR>
nnoremap <leader>V :vsplit<CR>
nnoremap <leader>C :split<CR>
nnoremap <leader>D :bd<CR>

function! s:ClangBuild()
  let l:file = expand('%')
  let l:output = expand('%:r')
  write
  execute '!clang -Wall -Wextra -Werror -std=c17 -g -fsanitize=address,undefined -fno-omit-frame-pointer ' . shellescape(l:file) . ' -o ' . shellescape(l:output . '.o')
endfunction
nnoremap <leader>r :call <SID>ClangBuild()<CR>
