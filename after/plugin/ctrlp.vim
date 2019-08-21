let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

if has("gui_macvim") && has("gui_running")
  map <D-t> :CtrlP<CR>
  imap <D-t> <ESC>:CtrpP<CR>
endif
