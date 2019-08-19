let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

if has("gui_macvim") && has("gui_running")
  " call janus#add_mapping('ctrlp', 'map', '<D-t>', ':CtrlP<CR>')
  map <D-t> :CtrlP<CR>
  " call janus#add_mapping('ctrlp', 'imap', '<D-t>', '<ESC>:CtrlP<CR>')
  imap <D-t> <ESC>:CtrpP<CR>
endif
