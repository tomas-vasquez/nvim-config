"startify
let g:startify_lists = [
\ { 'type': 'files',     'header': ['   MRU']            },
          \ ]

"indentLine
let g:indentLine_char_list = ['│']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_fileTypeExclude = [ 'startify' , 'nerdtree']

" Editor theme
if (has("termguicolors"))
  set termguicolors
endif
let g:palenight_color_overrides = {
\    'black': { 'gui': '#020c1bf2', "cterm": "0", "cterm16": "0" },
\}

colorscheme palenight

"  nerdtree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0

let NERDTreeShowLineNumbers=0
let NERDTreeMapOpenInTab='\'
let NERDTreeDirArrowExpandable=""
let NERDTreeDirArrowCollapsible=""


"airline
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_skip_empty_sections = 1
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#ctrlspace_show_tab_nr = 0
let g:airline#extensions#tabline#tabs_label = 'tabs'
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#show_buffers = 0

autocmd VimEnter * AirlineToggle
autocmd VimEnter * AirlineToggle

"git integration
set updatetime=100
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '>'

highlight SignifySignChange  guifg=#fff000
highlight SignifySignAdd     guifg=#22D039

"scroollbar
augroup ScrollbarInit
  autocmd!
  autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,FocusLost,BufLeave    * silent! lua require('scrollbar').clear()
augroup end

let g:scrollbar_shape = {
   \ 'head': '█',
   \ 'body': '█',
   \ 'tail': '█',
   \ }
let g:scrollbar_max_size = 3
let g:scrollbar_excluded_filetypes = ['nerdtree', 'tagbar']


"coc
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-eslint',
  \ 'coc-prettier'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
