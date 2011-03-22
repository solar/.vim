" vimrc
" 
" Copyright (c) 2011 Shinpei Okamura
"
" Licensed under the MIT license.
" http://www.opensource.org/licenses/mit-license.php
"

" 初期化 {{{
let $LANG = "ja_JP.UTF-8"
set encoding=utf-8

" augroupの設定
aug MyAutoCmd
    au!
aug END
" }}}

" 基本設定 {{{
syntax on
filetype plugin on
set modeline
set directory-=.
set iminsert=0
set imsearch=0
set history=100
" }}}

" 検索 {{{
set incsearch
set ignorecase
set smartcase
set hlsearch
" }}}

" 編集 {{{
set autoindent
set smartindent
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set showmatch
set wrapscan
set wildmenu
set tags=tags;
set formatoptions&
set formatoptions+=mM
let format_allow_over_tw = 1
" }}}

" 画面 {{{
colorscheme lucius
if has('gui_running')
    set guifont=DejaVu_Sans_Mono:h10:cSHIFTJIS
endif
set number
set ruler
set nolist
set wrap
set laststatus=2
set cmdheight=2
set showcmd
set title
set winwidth=30
set winminwidth=30
if &term == 'screen'
    let &t_Co=256
endif
" }}}

" 折りたたみ {{{
set foldmethod=marker
set foldopen=hor
set foldclose=
"}}}

" バックアップ {{{
set nobackup
" }}}

" キーマッピング {{{
nnoremap <C-E> g<C-]>

" ハイライト消去
noremap <Esc><Esc> :<C-u>nohlsearch<CR>

" レジスタ・マーク
nnoremap <Space>m   :<C-u>marks
nnoremap <Space>r   :<C-u>registers

" 最後に編集した場所
nnoremap gc `[v`]

" 検索パターンで/と?を使いやすくする
cnoremap <expr> /   getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?   getcmdtype() == '?' ? '\?' : '?'

" タブページを使いやすく
nnoremap <C-t>  <Nop>
nnoremap <C-t>n :<C-u>tabnew<CR>
nnoremap <C-t>c :<C-u>tabclose<CR>
nnoremap <C-t>o :<C-u>tabonly<CR>
nnoremap <C-t>j :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap <C-t>k gT

" タグを使いやすく
nnoremap t  <Nop>
nnoremap tt <C-]>
nnoremap tj :<C-u>tag<CR>
nnoremap tk :<C-u>pop<CR>
nnoremap tl :<C-u>tags<CR>

" ウィンドウ移動
noremap sj <C-w>j
noremap sk <C-w>k
noremap sh <C-w>h
noremap sl <C-w>l
noremap sc <C-w>c
noremap sn <C-w>n
noremap sv <C-w>v
noremap ss <C-w>s
noremap sJ <C-w>J
noremap sK <C-w>K
noremap sH <C-w>H
noremap sL <C-w>L

" ヘルプ
nnoremap <C-h>  :<C-u>help<Space>

" 補完内移動
inoremap <expr><C-j>    pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k>    pumvisible() ? "\<C-p>" : "\<C-k>"

" 挿入モードでIME状態を記憶させない
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" バッファを削除する際、ウィンドウレイアウトを維持する
:com! Bd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

" }}}

" ファンクション定義 {{{

" ウィンドウ幅を84以上に設定
function! s:good_width()
    if winwidth(0) < 84
        vertical resize 84
    endif
endfunction

" }}}

" その他 {{{
if !has('gui_running') && has('xterm_clipboard')
    set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif


" バッファ表示時にカレントディレクトリ設定
au MyAutoCmd BufEnter * execute ":lcd " . expand("%:p:h")

" コマンドラインウィンドウ {{{
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>

nmap ;  <sid>(command-line-enter)
xmap ;  <sid>(command-line-enter)

autocmd MyAutoCmd CmdwinEnter * call s:initializeCmdwin()
function! s:initializeCmdwin()
    nnoremap <buffer> q :<C-u>quit<CR>
    nnoremap <buffer> <TAB> :<C-u>quit<CR>
    inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
    inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
    inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

    " Completion.
    inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

    startinsert!
endfunction
" }}}

" マウス
set mouse=a
set nomousefocus
set nomousehide
" }}}

" エンコーディングの設定 {{{
" ずんWiki
" http://www.kawaz.jp/pukiwiki/?vim
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .','
    let &fileencodings = &fileencodings .',cp932,'. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" kaoriya版
if has('kaoriya')
  if exists('&ambiwidth')
    set ambiwidth=auto
  endif
  if has('guess_encode')
    set fileencodings=guess
  endif
endif
" }}}

" プラグイン {{{
" pathogen
call pathogen#runtime_append_all_bundles()

" NeoComplCache {{{
" NeoComplCacheを起動時に有効にする
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" スニペットの配置
let g:neocomplcache_snippets_dir = '~/vimfiles/snippets'

" スニペットを展開
imap <expr><TAB> neocomplcache#plugin#snippets_complete#expandable() ? "\(neocomplcache_snippets_expand)" : "\<TAB>"
smap <TAB> (neocomplcache_snippets_expand)

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" }}}

" Taglist {{{
let Tlist_Ctags_Cmd = 'c:\tools\bin\ctags.exe'
let Tlist_WinWidth = 40
let Tlist_Auto_Open = 0
let Tlist_Compact_Format = 1
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
nnoremap <silent> <F8> :TlistToggle<CR>
" }}}

" Unite {{{
" デフォルトでインサートモードにはしない
let g:unite_enable_start_insert = 0

" The prefix key.
"nnoremap [unite]
nmap ' [unite]
noremap [unite]u :Unite
nnoremap [unite]' :Unite buffer file<CR>
nnoremap [unite]t :Unite tab<CR>
nnoremap [unite]m :Unite file_mru<CR>
nnoremap [unite]o :Unite outline<CR>
nnoremap [unite]q :Unite qf -no-quit<CR>

let g:unite_source_file_mru_limit = 100
" }}}

" VimFiler {{{
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_trashbox_directory = expand("~/.vimfiler_trashbox")
" }}}

" Git-Vim {{{
if !has('unix')
    let g:git_bin = "c:/tools/git/bin/git.exe"
endif
let g:git_command_edit = "rightbelow vnew"
" }}}

" NERD Commenter {{{
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap <Space>/ <Plug>NERDCommenterToggle
nmap <Space>/a <Plug>NERDCommenterAppend
vmap <Space>/ <Plug>NERDCommenterToggle
vmap <Space>/s <Plug>NERDCommenterSexy
vmap <Space>/b <Plug>NERDCommenterMinimal
" }}}
" }}}

" ファイルタイプ {{{
" Java {{{
au MyAutoCmd FileType java setlocal omnifunc=javacomplete#Complete
au MyAutoCmd BufNew,BufEnter *.java set tags+=c:\Users\Solar\tags\java.tags
au MyAutoCmd BufDelete,BufLeave *.java set tags-=c:\Users\Solar\tags\java.tags
" }}}

" PHP {{{
au MyAutoCmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" }}}

" Python {{{
au MyAutoCmd FileType python setlocal omnifunc=pythoncomplete#Complete

" }}}

" その他 {{{
autocmd MyAutoCmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd MyAutoCmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd MyAutoCmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" }}}
" }}}

