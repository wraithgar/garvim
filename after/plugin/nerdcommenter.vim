" NERDCommenter mappings
if has("gui_macvim") && has("gui_running")
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
else
  map <leader>/ <plug>NERDCommenterToggle<CR>
endif

" NERDCommenter settings

" Spaces before comments
let g:NERDSpaceDelims = 1

" Flush comments to the left
let g:NERDDefaultAlign = 'left'
