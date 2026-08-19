" se shell=/bin/bash
se shell=/usr/bin/fish

se encoding=utf-8  " Set default encoding to UTF-8

se linebreak
se noerrorbells
se history=1000
color jellybeans

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make setlocal noexpandtab

  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} se ft=ruby

  " Make sure all markdown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  if !exists("g:disable_markdown_autostyle")
    au FileType markdown setlocal wrap linebreak textwidth=72 nolist
  endif

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python setlocal tabstop=4 shiftwidth=4

  " Reset json to json and set it up to use 2 spaces
  au BufNewFile,BufRead *.json se filetype=json
  au FileType json setlocal tabstop=2 shiftwidth=2

  " Make pug use 2 spaces
  au FileType pug setlocal tabstop=2 shiftwidth=2

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  if exists("g:autosave_on_blur")
    au FocusLost * silent! wall
  endif
  " No more automatic wrapping for any file type ever
  au BufEnter * set textwidth=0
endif

""
"" General Mappings (Normal, Visual, Operator-pending)
""

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" Map the arrow keys to be based on display lines, not physical lines
" map <Down> gj
" map <Up> gk

" Treat long lines as break lines (useful when moving around in them)
" map j gj
" map k gk

" Create a new tab with <leader>tn
map <leader>tn :tabnew<cr>

""
"" Basic Setup
""

" Yikes
se nomodeline

" Wildmenu is great
se wildmenu

" Tab bar always shown so gui vim doesn't go wonky w/ resizing
se showtabline=2

" No idea why this defaults to nowrapscan
se wrapscan

" Just go ahead and reload the file if it changed out from under us
se autoread

" Fold by syntax but start with everything open
se foldmethod=syntax
" se foldlevelstart=99
se nofoldenable


if has('vim_starting') && &compatible
  se nocompatible
endif

" Show hybrid line number and relative number
se number relativenumber

" toggle relativenumber when losing focus, but only if this buffer already has line numbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * if &number | se relativenumber | endif
  autocmd BufLeave,FocusLost,InsertEnter   * if &number | se norelativenumber | endif
augroup END

se ruler             " Show line and column number
let no_buffers_menu=1
syntax enable         " Turn on syntax highlighting allowing local overrides

""
"" Performance
""

se lazyredraw


""
"" Whitespace
""

se wrap                          " wrap lines
se tabstop=2                     " a tab is two spaces
se shiftwidth=2                  " an autoindent (with <<) is two spaces
se shiftround                     " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
se expandtab                     " use spaces, not tabs
se list                          " Show invisible characters
se backspace=indent,eol,start    " backspace through everything in insert mode
se smartindent

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

" List chars
se listchars=""                  " Reset the listchars
se listchars=tab:\ \             " a tab should display as "  ",
se listchars+=trail:.            " trailing whitespace as "."
se listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
se listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

""
"" Searching
""

se hlsearch    " highlight matches
se incsearch   " incremental searching
se ignorecase  " searches are case insensitive...
se smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""

set wildmode=list:longest,list:full

" Disable output and VCS files
se wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
se wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
se wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
se wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
se wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
se wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif
