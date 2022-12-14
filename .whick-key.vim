nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map =  {}
let g:which_key_sep = '→'

let g:which_key_map['_'] = { 'name': 'which_key_ignore' }
let g:which_key_map['h'] = { 'name': 'which_key_ignore' }

let g:which_key_map['o'] = [ ':Startify', '<leader-o>start screen' ]

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions',
      \ 'e' : ['<c-e>',                  '<c-e>toggle nerdtree'],
      \ 'v' : [':MarkdownPreview',        'markdown preview'],
      \ 'g' : [':GV',                    'show git log'],
      \ 'i' : [':IndentGuidesToggle',     'indent line toggle'],
      \ 'n' : [':set nonumber!',         'line-numbers'],
      \ 'r' : [':set norelativenumber!', 'relative line nums'],
      \ 's' : [':let @/ = ""',           '<leader-/>remove search highlight'],
      \ 'p' : [':StripWhitespace',       'strip whitespace'],
      \ }

" b is for buffer
let g:which_key_map.b = {
    \ 'name' : '+buffer' ,
    \ 'd' : ['bd'        , 'delete-buffer']   ,
    \ 'f' : [':MBEFocus'    , 'focus-buffer']    ,
    \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 'S' : [':!git status'                      , 'status'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }

" t is for terminal

" w is for windows
let g:which_key_map.w = {
      \ 'name' : '+windows',
      \ 'v' : ['<C-W>v',              'split right'],
      \ 's' : ['<C-W>s',              'split below'],
      \ '=' : ['<C-W>=',              'balance window'],
      \ 'j' : [':resize -2<CR>',      'resize -2'],
      \ 'k' : [':resize +2<CR>',      'resize +2'],
      \ 'h' : [':vertical resize -2', ':vertical resize -2'],
      \ 'l' : [':vertical resize +2', ':vertical resize +2'],
      \}



call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <localleader> :<c-u>WhichKeyVisual  ','<CR>
