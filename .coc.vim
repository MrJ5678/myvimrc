" coc
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

autocmd ColorScheme * hi CocMenu ctermbg=7 ctermbg=236
autocmd ColorScheme * hi CocMenuSel ctermbg=237 guibg=#13354A
autocmd ColorScheme * hi CocFloating ctermfg=black ctermbg=240
" coc
let g:coc_global_extensions = [
         \'coc-tsserver',
         \'coc-json',
         \'coc-pairs',
         \'coc-yank',
         \'coc-css',
         \'coc-html',
         \'coc-emmet',
         \'coc-snippets',
         \'coc-prettier',
         \]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
         \ coc#pum#visible() ? coc#pum#next(1) :
         \ CheckBackspace() ? "\<Tab>" :
         \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
         \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
   if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
   else
      call feedkeys('K', 'in')
   endif
endfunction

" Use <c-y> to trigger completion.
inoremap <silent><expr> <c-y> coc#refresh()

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap lf  <Plug>(coc-format-selected)
nmap lf  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" coc yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" coc prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
