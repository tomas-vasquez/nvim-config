"startify
let g:startify_lists = [
\ { 'type': 'files',     'header': ['   MRU']            },
          \ ]

let g:startify_custom_header = [
  \ '                                                                                   ___',
  \ '                                                                                  |__ \',
  \ '     ___ ___  _ __ ___   ___    _ __  _ __ ___   __ _ _ __ __ _ _ __ ___   __ _ _ __ ) |',
  \ "    / __/ _ \\| '_ ` _ \\ / _ \\  | '_ \\| '__/ _ \\ / _` | '__/ _` | '_ ` _ \\ / _` | '__/ /",
  \ '   | (_| (_) | | | | | | (_) | | |_) | | | (_) | (_| | | | (_| | | | | | | (_| | | |_|',
  \ '    \___\___/|_| |_| |_|\___/  | .__/|_|  \___/ \__, |_|  \__,_|_| |_| |_|\__,_|_| (_)',
  \ '                               | |               __/ |',
  \ '                               |_|              |___/',
  \'',
  \ ]

"indentLine
let g:indentLine_char_list = ['│']
let g:indentLine_bufTypeExclude = ['help', 'terminal', 'nerdtree']
let g:indentLine_fileTypeExclude = [ 'startify' ]

" Editor theme
function! TrailingSpaceHighlights() abort
  " Hightlight trailing whitespace
  highlight Trail ctermbg=red guibg=red
  call matchadd('Trail', '\s\+$', 100)
endfunction

autocmd! ColorScheme * call TrailingSpaceHighlights()
"autocmd! ColorScheme OceanicNext call s:custom_jarvis_colors()

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of preview window when open
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:MarkdownError
  endif
endfunction

set background=dark
colorscheme palenight

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:palenight_terminal_italics=1

let g:palenight_color_overrides = {
\    'black': { 'gui': '#000000', "cterm": "0", "cterm16": "0" },
\}

"  nerdtree
let g:webdevicons_enable_nerdtree = 0
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let NERDTreeShowLineNumbers=0
let NERDTreeMapOpenInTab='\'
let g:NERDTreeWinPos = "right"
let NERDTreeDirArrowExpandable="+"
let NERDTreeDirArrowCollapsible="~"

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
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#show_buffers = 0

autocmd VimEnter * AirlineToggle
autocmd VimEnter * AirlineToggle

"git integration
set updatetime=100
let g:signify_sign_add               = '>>'
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

