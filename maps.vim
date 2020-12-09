let mapleader="\ "

cnoreabbrev W w
cnoreabbrev Q q

" NerdTree
cnoreabbrev n NERDTreeToggle
cnoreabbrev N NERDTreeToggle

" testing
nnoremap <Leader>t :TestNearest<CR>
nnoremap <Leader>T :TestFile<CR>
nnoremap <Leader>TT :TestSuite<CR>

" split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

"CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" diagnostics
nnoremap <Leader>dia  :<C-u>CocList diagnostics<cr>
nnoremap <leader>kp :let @*=expand("%")<CR>

"  abs navigation
map <Leader>h :tabprevious<cr>
map <Leader>l :tabnext<cr>

" buffers
map <Leader>ob :Buffers<cr>

" faster scrolling
nnoremap <silent> <C-e> 10<C-e>
nnoremap <silent> <C-y> 10<C-y>
nmap <Leader>s <Plug>(easymotion-s2)

"git
nnoremap <Leader>G :G<cr>
nnoremap <Leader>gp :Gpush<cr>
nnoremap <Leader>gl :Gpull<cr>

"tabs
function OpenTab(tab)
  if a:tab == "next"
    :tabnext
  else
    :tabprevious
  endif
  :AirlineToggle
  :AirlineToggle
endfunction

nnoremap <C-Right> :call OpenTab("next")<cr>
nnoremap <C-Left> :call OpenTab("provious")<cr>
