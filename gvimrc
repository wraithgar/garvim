se guioptions=aegirLM
se vb t_vb=
if has("autocmd")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif

if has("gui_macvim")
  se guifont=DroidSansMNFM:h14 " This looks good in os/x
else
  " Make ubuntu clipboard be the vim clipboard
  se clipboard^=unnamedplus
  " :( artifacting hard in linux
  " se guifont=DroidSansM\ Nerd\ Font\ Mono\ 12
  se guifont=Monospace\ 10
endif
