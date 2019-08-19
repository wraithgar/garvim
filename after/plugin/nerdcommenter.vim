" NERDCommenter mappings
if has("gui_macvim") && has("gui_running")
  " call janus#add_mapping('nerdcommenter', 'map', '<D-/>', '<plug>NERDCommenterToggle<CR>')
  map <D-/> <plug>NERDCommenterToggle<CR>
  " call janus#add_mapping('nerdcommenter', 'imap', '<D-/>', '<Esc><plug>NERDCommenterToggle<CR>i')
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
else
  " call janus#add_mapping('nerdcommenter', 'map', '<leader>/', '<plug>NERDCommenterToggle<CR>')
  map <leader>/ <plug>NERDCommenterToggle<CR>
endif

" NERDCommenter settings

" Spaces before comments
let g:NERDSpaceDelims = 1

" Flush comments to the left
let g:NERDDefaultAlign = 'left'
