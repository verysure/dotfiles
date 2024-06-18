"----------------"
" Verysure vimrc "
"----------------"

" Auto Setup
" ==========
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
if empty(glob('~/.vim/colors/monokai.vim'))
    silent !curl -fLo ~/.vim/colors/monokai.vim --create-dirs
        \ https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
endif
if empty(glob('~/.vimswap'))
    silent !mkdir ~/.vimswap
endif


" VIM Settings
" ============
set hidden

"" Better command-line completion
set wildmenu
set wildmode=longest:full,full
set fileignorecase

"" Custom Bottom Line
set laststatus=2
set confirm
set cmdheight=1
set showcmd
set ruler

"" Cursor Line
set cursorline

"" visual bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"" Mouse settings
set mouse=a
" for fixing tmux drag issues
if &term =~ '^screen'
    set ttymouse=xterm2
endif

"" Numbering
set number
set relativenumber

"" Other 
set notimeout ttimeout ttimeoutlen=200
set backspace=indent,eol,start
set nostartofline
set wrap 
set linebreak

"" Indentation
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set breakindent

"" Swap files and spellfiles
set dir=~/.vimswap
set spellfile=~/.vim/spell/en.utf-8.add

"" Textwidth
set textwidth=0

"" Autorefresh File
set autoread

"" Double indent issues
let g:pyindent_open_paren = '&sw'
set cinoptions+=+1

"" Splits
set splitright
set splitbelow

"" Filetypes
autocmd BufNewFile,BufRead *.tex setfiletype tex
autocmd Filetype vimwiki setlocal shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal shiftwidth=2 softtabstop=2

"" encryption
set cryptmethod=blowfish2

"" Color schemes
syntax enable
" colorscheme monokai
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
if (has('termguicolors'))
  set termguicolors
endif

"" search
set ignorecase
set smartcase
set hlsearch
nmap <leader>n :nohl<cr>
" use :nohl to hide the highlights

"" Make syntax faster on slow computer
" syntax sync minlines=50
" set ttyfast
" set lazyredraw
" set re=1

"" gui options
set guifont=Hack
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

if has('gui_running')
    nnoremap j gj
    nnoremap k gk
endif

"" Key Maps
" tabs
nmap <S-TAB> gT
nmap <TAB> gt
nmap <C-T> :tabedit 
" indent
imap <S-TAB> <C-D>
" copy
vnoremap <C-C> "+y
inoremap <C-V> <C-r><C-p>+
" add
nnoremap <C-C> <C-a>
" macro
nnoremap Q @q
" motions
nnoremap M `m


" Commands
" ========
command! -nargs=1 -complete=help THelp tab help <args>

" ------------------------
" Plugin Manager: vim-plug
" ------------------------
" commands
" ========
" :so[urce] %
" :PlugInstall
" :PlugUpdate
" :PlugUpgrade, updates vim-plug
" :PlugClean[!]
" :PlugStatus
" :PlugDiff
" :PlugSnapshot

call plug#begin('~/.vimplugged')

"" session
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
let g:session_autoload='no'
let g:session_autosave='yes'
let g:session_autosave_periodic=5
let g:session_autosave_silent=1
set sessionoptions-=buffers

"" multiple cursors
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

"" CSS color display
Plug 'ap/vim-css-color'

"" material
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
let g:material_theme_style = 'darker'

"" markdown syntax
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math = 1

"" less
Plug 'groenewege/vim-less'

"" flutter & dart
Plug 'dart-lang/dart-vim-plugin'
let g:dart_style_guide = 2

"" airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_tab_count = 1
" let g:airline#extensions#tabline#tab_nr_type = 1
" let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#tabline#show_buffers = 0
" let g:airline_theme = 'angr'
" let g:airline#extensions#whitespace#enabled = 0 

"" minimap
" Plug 'severin-lemaignan/vim-minimap'

"" file usage
Plug 'tpope/vim-eunuch'

"" Commenter
Plug 'tomtom/tcomment_vim'

"" HTML
Plug 'tpope/vim-surround'

"" Autoclose
Plug 'raimondi/delimitmate'

"" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

"" Indent Guides
Plug 'nathanaelkane/vim-indent-guides'
" nmap <C-g> <leader>ig
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=232
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238

"" Easymotion
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 1
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-sn)
nmap <Leader>y y<Plug>(easymotion-bd-jk)
nmap <Leader>d d<Plug>(easymotion-bd-jk)
nmap <Leader>x d<Plug>(easymotion-bd-el)

"" tagbar
Plug 'majutsushi/tagbar'
let g:tagbar_hide_nonpublic = 1
let g:tagbar_sort = 0

"" quickmenu
Plug 'skywind3000/quickmenu.vim'

"" vimwiki
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/.vim/wiki/', 'auto_toc': 1, 'list_margin': 0}]
let g:vimwiki_map_prefix = '<Leader>i'
let g:vimwiki_toc_header = 'TOC'
let g:vimwiki_hl_cb_checked = 1
" let g:vimwiki_url_maxsave = 0
hi VimwikiHeader1 ctermfg=197
hi VimwikiHeader2 ctermfg=148
hi VimwikiHeader3 ctermfg=81
hi VimwikiHeader4 ctermfg=186
hi VimwikiHeader5 ctermfg=186
hi VimwikiHeader6 ctermfg=186
hi VimwikiBoldItalic cterm=bold ctermfg=208
" for local commands, go to: .vim/ftplugin/vimwiki.vim

"" fzf
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
let g:fzf_action = {'enter': 'tab split'}
let g:fzf_layout = {'down': '30%'}
nmap <C-p> :FZF<cr>

"" vim-easy-align
Plug 'junegunn/vim-easy-align'
nmap <C-g> vip:LiveEasyAlign<cr>
vmap <C-g> :LiveEasyAlign<cr>
" vmap <Enter> :LiveEasyAlign<cr>
let g:easy_align_delimiters = {
\  ':': { 'pattern': ':',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\  ',': { 'pattern': ',',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"" Latex
Plug 'lervag/vimtex'
let g:vimtex_compiler_latexmk = {'callback' : 0, 'continuous': 0}
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--noraise --unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--noraise --unique'
let g:vimtex_mappings_enabled = 1
let g:vimtex_quickfix_mode = 0
" setup backward search from okular:
" Configure Okular > Editor > Custom Text Editor
" vim --remote-silent %f -c %l
" open vim with servername

"" folder dif
Plug 'will133/vim-dirdiff', {'on': 'DirDiff'}

"" for writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
let g:seoul256_background=235
let g:goyo_width='60%'
nmap z- 1z=

function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set nocursorline
    set spell
    Limelight
    colorscheme seoul256
    nnoremap j gj
    vnoremap j gj
    nnoremap k gk
    vnoremap k gk
    nnoremap $ g$
    vnoremap $ g$
    nnoremap ^ g^
    vnoremap ^ g^
endfunction

function! s:goyo_leave()
    set showmode
    set showcmd
    set cursorline
    set nospell
    Limelight!
    colorscheme monokai
    nunmap j
    vunmap j
    nunmap k
    vunmap k
    nunmap $
    vunmap $
    nunmap ^
    vunmap ^
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

call plug#end()
" ------------------------
" END
" ------------------------
"
colorscheme material

"" quickmenu
let g:quickmenu_options = "HL"
nnoremap <leader>m :call quickmenu#toggle(0)<cr>
call g:quickmenu#reset()
call g:quickmenu#append('# Toggle', '')
call g:quickmenu#append('Paste Mode', 'set paste!')
call g:quickmenu#append('Spell Check', 'set spell!')
call g:quickmenu#append('Search highlight', 'set hlsearch!')
call g:quickmenu#append('Relative Number', 'set relativenumber!')
call g:quickmenu#append('Indent Guide Lines', 'IndentGuidesToggle')
call g:quickmenu#append('Goyo Mode', 'Goyo')

call g:quickmenu#append('# Vimtex', '', '', 'tex')
call g:quickmenu#append('Compile (\c)', 'VimtexCompile', '', 'tex')
call g:quickmenu#append('Clean', 'VimtexClean', '', 'tex')
call g:quickmenu#append('Error (\r)', 'VimtexErrors', '', 'tex')

call g:quickmenu#append('# vim-plug', '', '', 'vim')
call g:quickmenu#append('Install', 'PlugInstall', '', 'vim')
call g:quickmenu#append('Update', 'PlugUpdate', '', 'vim')
call g:quickmenu#append('Upgrade vim-plug', 'PlugUpgrade', '', 'vim')
call g:quickmenu#append('Clean Up', 'PlugClean', '', 'vim')

