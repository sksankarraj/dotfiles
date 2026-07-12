" CoC.nvim
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>sd <Plug>(coc-diagnostic-info)
nmap <leader>ft <Plug>(coc-format)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

augroup CocOrganizeImports
  autocmd!
  autocmd BufWritePre *.ts,*.tsx call CocAction('runCommand', 'tsserver.organizeImports')
augroup END

" fzf.vim
nnoremap <leader>fa :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>ff :GFiles<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>fk :Maps<CR>
nnoremap <leader>fc :Commands<CR>

vnoremap <leader>8 <Esc>:<C-u>call VisualSelectionGrep()<CR>
vnoremap <leader>gw <Esc>:<C-u>call VisualSelectionGrep()<CR>

function! VisualSelectionGrep() abort
  let pattern = VisualSelection()
  execute 'Rg ' . shellescape(pattern)
endfunction

function! VisualSelection() abort
  let [_, s, e] = getpos("'<")
  let l = getline(s[1])
  let lines = getline(s[1], e[1])
  if len(lines) == 1
    return l[s[2] - 1 : e[2]]
  else
    let lines[-1] = lines[-1][: e[2] - 1]
    let lines[0] = lines[0][s[2] - 1:]
    return join(lines, "\n")
  endif
endfunction

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.DS_Store$']
nnoremap <tab> :NERDTreeFind<CR>
nnoremap <leader>ef :NERDTreeFindToggle<CR>
nnoremap <leader>ec :NERDTreeClose<CR>
nnoremap <leader>er :NERDTreeRefreshRoot<CR>

" vim-floaterm
let g:floaterm_opener = 'edit'
let g:floaterm_wintype = 'floating'
let g:floaterm_borderchars = '─│─│╭╮╯╰'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
nnoremap <C-q> :FloatermToggle<CR>
inoremap <C-q> <Esc>:FloatermToggle<CR>
tnoremap <C-q> <C-\><C-n>:FloatermToggle<CR>
nnoremap <leader>lg :FloatermNew --width=0.9 --height=0.9 lazygit<CR>

" vim-gitgutter + fugitive
nnoremap <leader>gp :GitGutterPreviewHunk<CR>
nnoremap <leader>gt :Git blame<CR>

" vim-test + vimux
let test#strategy = 'vimux'
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>T :TestFile<CR>
nnoremap <leader>a :TestSuite<CR>
nnoremap <leader>l :TestLast<CR>
nnoremap <leader>g :TestVisit<CR>

" vim-airline + catppuccin
let g:airline_powerline_fonts = 1
let g:airline_theme = 'catppuccin_mocha'

" catppuccin
silent! colorscheme catppuccin_mocha

" vim-highlightedyank
let g:highlightedyank_highlight_duration = 200

" vim-closetag
let g:closetag_filenames = 'html,xhtml,phtml,jsx,tsx'

" vim-startify
let g:startify_custom_header = [
  \ '                                                     ',
  \ '  ██╗   ██╗██╗███╗   ███╗',
  \ '  ██║   ██║██║████╗ ████║',
  \ '  ██║   ██║██║██╔████╔██║',
  \ '  ╚██╗ ██╔╝██║██║╚██╔╝██║',
  \ '   ╚████╔╝ ██║██║ ╚═╝ ██║',
  \ '    ╚═══╝  ╚═╝╚═╝     ╚═╝',
  \ '                                                     ',
  \ ]

" vim-sneak
let g:sneak_use_label_overlay = 1

" vim-javascript / jsx-pretty
let g:javascript_plugin_jsx = 1
let g:javascript_plugin_flow = 1
