" ############################################################################ "
"                         vimrc by Bryan Yap
" ############################################################################ "
"
" taken inspiration from:
"
" - https://github.com/skwp/dotfiles
" - https://github.com/bryankennedy/vimrc/blob/master/vimrc
" - and many, many more...
"

set nocompatible              " be iMproved, required
set ttyfast
set lazyredraw
set foldmethod=marker
set foldlevel=0
set modelines=1
filetype off                  " required

set pyxversion=3

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugins {{{
" ############################################################################ "
"                               Plugins
" ############################################################################ "

Plug 'tpope/vim-fugitive'                     " Git plugin
Plug 'scrooloose/nerdtree'                    " A tree explorer plugin for vim
Plug 'tpope/vim-surround'                     " quoting/parenthesizing made simple
Plug 'ctrlpvim/ctrlp.vim'                     " Fuzzy file, buffer, mru, tag, etc finder
" Plug 'altercation/vim-colors-solarized'       " Precision colorscheme for vim
Plug 'rust-lang/rust.vim'                     " Vim support for Rust file detection and syntax highlighting
Plug 'bling/vim-airline'                      " Lean & mean status/tabline for vim that’s light as air
Plug 'mattn/emmet-vim'                        " Emmet for Vim
Plug 'othree/html5.vim'                       " HTML5 autocomplete and syntax
Plug 'hail2u/vim-css3-syntax'                 " Vim syntax file for SCSS and improved CSS syntax highlighting
Plug 'tomtom/tcomment_vim'                    " An extensible & universal comment vim-plugin that also handles embedded filetypes
Plug 'w0rp/ale'                               " An asynchronous linting engine
" Plug 'rking/ag.vim'                           " Vim plugin to search using the silver searcher (ag)
Plug 'cespare/vim-toml'                       " Syntax highlighting for TOML files
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'raimondi/delimitmate'                   " Add closing delimiters automagically
Plug 'groenewege/vim-less'                    " Syntax highlighting for LESS
Plug 'christoomey/vim-tmux-navigator'         " Seamless navigation between tmux panes and splits
Plug 'pangloss/vim-javascript'                " Improves JavaScript syntax and indenting
Plug 'mxw/vim-jsx'                            " Syntax highlighting and indenting for jsx
Plug 'andymass/vim-matchup'                   " Extend % matching to support more than one character
Plug 'Lokaltog/vim-easymotion'                " Vim motions on speed!
Plug 'sophacles/vim-processing'               " Develop Processing sketches on Vim!
Plug 'tpope/vim-abolish'                      " Easily search for, substitute and abbreviate multiple variants of a word
Plug 'elixir-lang/vim-elixir'                 " Syntax highlighting for ex, exs and eex files
Plug 'tikhomirov/vim-glsl'                    " Vim syntax highlighting for OpenGL Shading Language
Plug 'janko-m/vim-test'                       " Runs tests
Plug 'wellle/targets.vim'                     " More Vim text objects, works on arguments and delimited texts
" Plug 'atelierbram/vim-colors_duotones'        " The duotones color scheme
Plug 'airblade/vim-gitgutter'                 " Shows where the git diffs are
" Plug 'marijnh/tern_for_vim'                   " Tern plugin for VIM
" Plug 'majutsushi/tagbar'                      " Vim plugin that displays tags in a window
Plug 'ryanoasis/vim-devicons'                 " Adds file type glyphs/icons
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'leafgarland/typescript-vim'             " Adds syntax highlighting for TypeScript (.ts) files
Plug 'ianks/vim-tsx'                          " Adds support for tsx files
Plug 'hashivim/vim-terraform'                 " Adds support for terraform files, including some shortcuts to run terraform commands
Plug 'quramy/tsuquyomi'                       " Adds tsc support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Adds support for GoLang
" Plug 'overcache/NeoSolarized'                 " Adds a modern vim solarized theme
Plug 'sonph/onehalf', {'rtp': 'vim/'}

let g:deoplete#enable_at_startup = 1

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}
" General Editor Configurations {{{
" ############################################################################ "
"                           General Configurations
" ############################################################################ "


set hlsearch                                    " Highlight all search results
set incsearch                                   " Searches for strings incrementally
set scrolloff=3                                 " Give a margin around searches and movement

set autoindent                                  " Naïve indenting
set smartindent                                 " Smart indenting for C-like languages
set shiftwidth=2                                " Number of auto-indent spaces
set softtabstop=2                               " Number of spaces to make a Tab
set tabstop=2                                   " Number of spaces used per Tab
set smarttab                                    " Enable smart-tabs
set expandtab                                   " Replace tabs with spaces
set list listchars=tab:\ \ ,trail:·             " Display tabs and trailing spaces visually

set number                                      " Show line numbers
set ruler                                       " Show row and column ruler information
set nowrap                                      " No line wrapping
set backspace=indent,eol,start                  " Fix backspace for insert mode
set confirm                                     " Require confirmation before closing
set cursorline                                  " Highlight the current line
let &colorcolumn=join(range(81, 512), ",")      " puts thick boundary after the 80 character line

set regexpengine=1                              " Force Vim to use the old Regex Engine, significantly improve performance (see https://bugs.archlinux.org/task/36693)

set fillchars+=vert:\ |                         " Remove the ugly vertical split character

syntax enable                                   " Enable syntax highlighting
set encoding=utf-8
set t_Co=256
set termencoding=utf-8

set wildmode=longest,list                       " Tab completion shows the list of potential matches

set visualbell                                  " Turn off error bell
set shell=/bin/sh                               " Vim’s default shell

set updatetime=250                              " Reduces the time taken to check for updates, as suggested by http://vimawesome.com/plugin/vim-gitgutter

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

set undolevels=1000                             " Because 100 isn’t enough
set noswapfile                                  " Turn off swap files
set nobackup
set nowb

" Because color matters
autocmd BufRead,BufNewFile *jshintrc,*bowerrc,*babelrc set filetype=json
autocmd BufRead,BufNewFile *Gemfile*,Vagrantfile,Guardfile,*pryrc set filetype=ruby
autocmd BufRead,BufNewFile *eslintrc,*Procfile set filetype=yaml
autocmd BufRead,BufNewFile *Dockerfile* set filetype=dockerfile
autocmd BufRead,BufNewFile mix.lock set filetype=elixir
autocmd BufRead,BufNewFile *Makefile set noexpandtab
autocmd BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,nginx.conf if &ft == '' | setfiletype nginx | endif
autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescript.tsx

" And so does space
autocmd Filetype glsl setlocal tabstop=4 softtabstop=4 shiftwidth=4

augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" }}}
" Colorscheme {{{
" ############################################################################ "
"                               Colorscheme
" ############################################################################ "
" Colorscheme Solarized
set background=dark
" set termguicolors
colorscheme NeoSolarized
" colorscheme onehalfdark
highlight clear SignColumn
" check colors with: curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash
highlight Normal ctermfg=14 ctermbg=256
highlight Visual ctermfg=8 ctermbg=256
exec "highlight ColorColumn    cterm=NONE ctermfg=196"

" " Colorscheme Duotone-Darkspace
" set background=dark
" colorscheme duotone-darkspace
" highlight clear SignColumn
" highlight CursorLine     				ctermbg=238
" highlight ColorColumn    				cterm=NONE ctermfg=196 ctermbg=238
" highlight CursorLineNr   				ctermbg=238
" highlight CursorColumn   				ctermbg=238
" highlight GitGutterAdd 					ctermbg=000
" highlight GitGutterChange 			ctermbg=000
" highlight GitGutterDelete 			ctermbg=000
" highlight GitGutterChangeDelete ctermbg=000

" highlight Visual ctermbg=24 guibg=24
" }}}
" Custom Functions {{{
" ############################################################################ "
"                             Custom Functions
" ############################################################################ "


" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction


function! ToggleLocList()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        exec('lopen')
        wincmd p
    endif
endfunction

" }}}
" Plugin configurations {{{
" ############################################################################ "
"                           Plugin configurations
" ############################################################################ "
" CtrlP {{{
let g:ctrlp_by_filename = 1                                 " Grep by filename by default
let g:ctrlp_switch_buffer = 0
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" }}}
" Ag {{{
let g:ag_highlight = 1
" }}}
" Ale {{{
let g:ale_sign_error = '×»'
let g:ale_sign_warning = '⚠»'
" Use :help ale-integration-rust to find out why Rust is setup this way
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
      \'typescript': ['tslint'],
      \'jsx': ['eslint'],
      \'rust': ['cargo'],
      \'javascript': ['eslint']
      \}
let g:ale_rust_ignore_error_codes = ['E0432', 'E0583']          " ignores 'Unresolved import' and 'File not found' errors respectively because of the limitation of the rustc linter
" }}}
" Airline {{{
" see: https://coderwall.com/p/yiot4q/setup-vim-powerline-and-iterm2-on-mac-os-x
set laststatus=2                                            " Enable the Airline in single Vim panes
let g:airline_powerline_fonts = 1                           " Enable Powerline fonts
let g:airline_theme='onehalfdark'
" }}}
" Emmet {{{
autocmd BufEnter * call EnableEmmetIfHtml()                 " Optionally enable intelligent Emmet expansion

function EnableEmmetIfHtml()
  if &ft =~ 'html' || &ft =~ 'eruby' || &ft =~ 'javascript' || &ft =~ 'eelixir' || &ft =~ 'svg' || &ft =~ 'typescript'
    imap <expr><C-e> emmet#expandAbbrIntelligent("\<Tab>")
  else
    imap <expr><C-e> "\<C-e>"
  endif
endfunction
" }}}
" Neocomplete {{{
let g:acp_enableAtStartup = 0                                 " Disable default auto-complete
let g:neocomplete#enable_at_startup = 1                       " Use neocomplete
let g:neocomplete#enable_smart_case = 1                       " Use smartcase
let g:neocomplete#sources#syntax#min_keyword_length = 3       " Set minimum syntax keyword length
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"       " Enable tab completion for neocomplete
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"   " Tab completion in reverse

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" "}}}
" Tmux Navigator {{{
let g:tmux_navigator_no_mappings = 1
" }}}
" Limelight {{{
let g:limelight_conceal_ctermfg = 0
" }}}
" Devicons {{{
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
" }}}
" Tagbar {{{
let g:tagbar_type_rust = {
   \ 'ctagstype' : 'rust',
   \ 'kinds' : [
       \'T:types,type definitions',
       \'f:functions,function definitions',
       \'g:enum,enumeration names',
       \'s:structure names',
       \'m:modules,module names',
       \'c:consts,static constants',
       \'t:traits,traits',
       \'i:impls,trait implementations',
   \]
   \}
" }}}

" Tsuquyomi {{{
let g:tsuquyomi_disable_quickfix = 1
" }}}

" Syntastic {{{
let g:syntastic_typescript_checkers = ['tsuquyomi']
" }}}

" }}}
" Custom Key Bindings {{{
" ############################################################################ "
"                             Custom Key Bindings
" ############################################################################ "
"
" NOTE: The trailing pipes just allow the comments on the right without
" messing up the commands


let mapleader = ","|                                                      " Change the leader key

nnoremap 0 ^|                                                             " Swap keys 0 -> ^
nnoremap ^ 0|                                                             " Swap keys ^ -> 0

nnoremap ˚ {|                                                             " OS X only: sets Alt + k -> {
nnoremap ∆ }|                                                             " OS X only: sets Alt + j -> }
vnoremap ˚ {|                                                             " OS X only: sets Alt + k -> {
vnoremap ∆ }|                                                             " OS X only: sets Alt + j -> }

nnoremap <Leader>w :%s/\s\+$<CR><C-o>:nohlsearch<CR>|                     " Clear all trailing whitespaces

nnoremap <Leader>gg :Ag ""<Left>|                                         " Recursively grep for text matches in all files under the current directory
vnoremap <Leader>gg <Esc>:Ag "<C-r>=GetVisual()<CR>"<Left>|               " Same as above, but using the selected text
nnoremap <Leader>gf :AgFile ""<Left>|                                     " Recursively grep for file matches in the current directory
vnoremap <Leader>gf <Esc>:AgFile "<C-r>=GetVisual()<CR>"<Left>|           " Same as above, but using the selected text

let g:ctrlp_map = '<Leader>t'|                                            " Shortcut for CtrlP
nnoremap <Leader>t :CtrlP<CR>|                                            " Same as above, but prevents remapping
nnoremap <Leader>b :CtrlPBuffer<CR>|                                      " Shortcut for CtrlPBuffer

nnoremap <Leader>n :nohlsearch<CR>|                                       " Clear search highlighting
nnoremap <Leader>s *N|                                                    " Search for the word under the cursor
vnoremap <Leader>s <Esc>/<C-r>=GetVisual()<CR><CR>N|                      " Search for the current selection
nnoremap <Leader>r *N:%s///gc<Left><Left><Left>|                          " Search and replace word under the cursor
vnoremap <Leader>r <Esc>:%s/<C-r>=GetVisual()<CR>//gc<Left><Left><Left>|  " Search and replace selection
nnoremap <Leader>c *Ncw|                                                  " Search for the word under the cursor and change current word

nnoremap <Leader>d /\<<C-r>=expand('<cword>')<CR>\>

nnoremap <C-l> :TmuxNavigateRight<CR>|                                    " Shortcut to switch to right pane
nnoremap <C-h> :TmuxNavigateLeft<CR>|                                     " Shortcut to switch to left pane
if has('nvim')
  " FIXME workaround for issue issue: https://github.com/neovim/neovim/issues/2048
  nnoremap <BS> :TmuxNavigateLeft<CR>
endif
nnoremap <C-j> :TmuxNavigateDown<CR>|                                     " Shortcut to switch to bottom pane
nnoremap <C-k> :TmuxNavigateUp<CR>|                                       " Shortcut to switch to top pane

nnoremap <Leader>p :set invpaste paste?<CR>|                              " Toggle paste mode
nnoremap <Leader>l :<C-u>call ToggleLocList()<CR>|                        " Toggle locations list
nnoremap <Leader>m :TagbarToggle<CR>|                                     " Toggle Tagbar

nnoremap vv :vsplit<CR>|                                                  " Shortcut for :vsplit
nnoremap ss :split<CR>|                                                   " Shortcut for :split

nnoremap <Leader>! :silent !!<CR>:redraw!<CR>|                            " Reruns the last shell command
nnoremap <Leader>f :NERDTreeFind<CR>|                                     " Opens the current file in the NERDTree

" Runs the command in a new tmux window and keeps Vim in its current state
function TmuxRun(cmd)
  execute 'silent !tmux new-window -k -n"' . a:cmd . '" -c "\#{pane_current_path}" -t:0 "' . a:cmd . '; bash -c ''read -t 1 -n 10000 discard; read -p\"Done, Press any key to close the tmux window\" -n 1 -s''"'
  redraw!
endfunction

" ====[ Shell Helpers ]====
nmap <Leader>RT :call TmuxRun('')<Left><Left>|                            " Helper to bring up the TmuxRun command with a customizable command

" ====[ Ruby Helpers ]====
nnoremap <Leader>RR :call TmuxRun('bundle exec rspec %')<CR>|             " Run the current spec

" ====[ JavaScript Helpers ]====
nnoremap <Leader>KK :call TmuxRun('karma start --single-run')<CR>|        " Run the karma start task with the single run option
nnoremap <Leader>KR :call TmuxRun('karma run')<CR>|                       " Run the karma run task

" ====[ Rust Helpers ]====
nnoremap <Leader>CB :call TmuxRun('cargo build')<CR>|                     " Executes cargo build
nnoremap <Leader>CT :call TmuxRun('cargo test')<CR>|                      " Executes cargo test
nnoremap <Leader>CD :call TmuxRun('cargo doc')<CR>|                       " Executes cargo doc
nnoremap <Leader>CR :call TmuxRun('cargo run')<CR>|                       " Executes cargo run
nnoremap <Leader>CE :call TmuxRun('cargo run --example ""')<Left><Left><Left>|  " Executes cargo run

" ====[ Testing ]====
nmap <Leader>TA :TestSuite<CR>                                            " Run all tests
nmap <Leader>TT :TestLast<CR>                                             " Run last test
nmap <Leader>TF :TestFile<CR>                                             " Run all tests in the current file
nmap <Leader>TN :TestNearest<CR>                                          " Run tests nearest to the cursor

let g:test#custom_strategies = { 'tmux-window': function('TmuxRun') }
let g:test#strategy = "tmux-window"

let test#runners = { 'rust': ['Cargo'] }

" ====[ Teaching Aids ]====
noremap <Left> :throw " Vim Tip #1: Use “h” to navigate left"<CR>
noremap <Right> :throw " Vim Tip #2: Use “l” to navigate right"<CR>
noremap <Up> :throw " Vim Tip #3: Use “k” to navigate upwards"<CR>
noremap <Down> :throw " Vim Tip #4: Use “j” to navigate down"<CR>

inoremap <Left> <C-o>:throw " Vim Tip #5: Always leave insert mode before trying to navigate"<CR>
inoremap <Right> <C-o>:throw " Vim Tip #5: Always leave insert mode before trying to navigate"<CR>
inoremap <Up> <C-o>:throw " Vim Tip #5: Always leave insert mode before trying to navigate"<CR>
inoremap <Down> <C-o>:throw " Vim Tip #5: Always leave insert mode before trying to navigate"<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
