" ============================================================================ "
" ===                      CUSTOM COLORSCHEME CHANGES                      === "
" ============================================================================ "
"
" Add custom highlights in method that is executed every time a colorscheme is sourced
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f for details

set termguicolors

function! TrailingSpaceHighlights() abort
  " Hightlight trailing whitespace
  highlight Trail ctermbg=red guibg=red
  call matchadd('Trail', '\s\+$', 100)
endfunction

function! s:custom_jarvis_colors()
  " coc.nvim color changes
  hi link CocErrorSign WarningMsg
  hi link CocWarningSign Number
  hi link CocInfoSign Type

  " Make background transparent for many things
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi LineNr ctermfg=NONE guibg=NONE
hi SignColumn ctermfg=NONE guibg=NONE
hi StatusLine guifg=#16252b guibg=#6699CC
hi StatusLineNC guifg=#16252b guibg=#16252b

  " Try to hide vertical spit and end of buffer symbol
  hi VertSplit gui=NONE guifg=#17252c guibg=#17252c
  hi EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=#17252c guifg=#17252c

  " Customize NERDTree directory
  hi NERDTreeCWD guifg=#99c794

  " Make background color transparent for git changes
  hi SignifySignAdd guibg=NONE
  hi SignifySignDelete guibg=NONE
  hi SignifySignChange guibg=NONE

  " Highlight git change signs
  hi SignifySignAdd guifg=#99c794
  hi SignifySignDelete guifg=#ec5f67
  hi SignifySignChange guifg=#c594c5
endfunction

"autocmd! ColorScheme * call TrailingSpaceHighlights()
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

" Editor theme
set background=dark

try
  colorscheme OceanicNext
catch
  colorscheme slate
endtry

"  nerdtree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=0
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=0
let NERDTreeMapOpenInTab='\t'
let g:javascript_plugin_flow = 1
let g:NERDTreeWinPos = "right"
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ } " git-plugin

"airline
set updatetime=100
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_skip_empty_sections = 1
let g:airline_section_y = ''

autocmd VimEnter * AirlineToggle
autocmd VimEnter * AirlineToggle

"git-gutter
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = 'ww'
