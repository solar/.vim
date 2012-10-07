"
" vimrc
"

" 初期化 {{{
let $LANG = "ja_JP.UTF-8"
set encoding=utf-8
" }}}

" NeoBundle {{{
filetype off
if has('vim_starting')
    set rtp+=$HOME/.vim/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'sgur/unite-qf'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'othree/eregex.vim'
NeoBundle 'Align'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'xmledit'

filetype plugin indent on
" }}}

" augroup
aug MyAutoCmd
    au!
aug END
" }}}

" 基本設定 {{{
syntax on
set modeline
set iminsert=0
set imsearch=0
set history=100

set runtimepath+=$HOME/.vim,$HOME/.vim/after

if has('win32') || has('win64')
    set directory=c:/tmp
else
    set directory=~/tmp
endif
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
set tabstop=4
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
" }}}

" 画面 {{{
colorscheme lucius
set number
set ruler
set list
set listchars=tab:>-,trail:-
set wrap
set laststatus=2
set cmdheight=2
set showcmd
set title
set virtualedit+=block
set winwidth=30
set winminwidth=30
if &term == 'screen'
    let &t_Co=256
endif
if &term == 'cygwin'
    colorscheme desert
endif
set pvh=26
" }}}

" 折りたたみ {{{
set foldmethod=marker
set foldopen=hor
set foldclose=
"}}}

" バックアップ {{{
set backup
if has('win32') || has('win64')
    set backupdir=c:/tmp
else
    set backupdir=~/tmp
endif
" }}}

" キーマッピング {{{
nnoremap <C-E> g<C-]>

nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>

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
nmap <C-t>  <SID>[tab]
nnoremap <SID>[tab]n :<C-u>tabnew<CR>
nnoremap <SID>[tab]c :<C-u>tabclose<CR>
nnoremap <SID>[tab]o :<C-u>tabonly<CR>
nnoremap <SID>[tab]j :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap <SID>[tab]k gT

" タグを使いやすく
nmap t  <SID>[tag]
nnoremap <SID>[tag]t <C-]>
nnoremap <SID>[tag]j :<C-u>tag<CR>
nnoremap <SID>[tag]k :<C-u>pop<CR>
nnoremap <SID>[tag]l :<C-u>tags<CR>

" ウィンドウ移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sc <C-w>c
nnoremap sn <C-w>n
nnoremap sv <C-w>v
nnoremap ss <C-w>s
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sH <C-w>H
nnoremap sL <C-w>L

" ヘルプ
nnoremap <C-h>  :<C-u>help<Space>

" 補完内移動
inoremap <expr><C-j>    pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k>    pumvisible() ? "\<C-p>" : "\<C-k>"

" 挿入モードでIME状態を記憶させない
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" バッファを削除する際、ウィンドウレイアウトを維持する
:com! Bd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

" Yで行末までヤンク
nnoremap Y y$

" }}}

" ファンクション定義 {{{
" }}}

" その他 {{{
if !has('gui_running') && has('xterm_clipboard')
    set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

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
set termencoding=utf-8
" }}}

" プラグイン {{{

" NeoComplCache
source $HOME/.vim/config/neocomplcache.vim

" Unite
source $HOME/.vim/config/unite.vim

" fugitive
source $HOME/.vim/config/fugitive.vim

" scalacommenter
source $HOME/.vim/config/scalacommenter.vim

" VimFiler {{{
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_trashbox_directory = expand("~/.vimfiler_trashbox")

nnoremap <Space>f :<C-u>VimFiler<CR>
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

" easymotion {{{
let g:EasyMotion_leader_key = '<Space><Space>'
" }}}

" format.vim {{{
let format_allow_over_tw = 1
" }}}

" eregex {{{
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?
" }}}
" }}}

" ファイルタイプ {{{
" 編集時にファイルの存在するディレクトリに移動
au MyAutoCmd BufEnter c:/*.{java,php,tpl,rb,py,pl,cgi,scala,sbt,c,cpp,h} execute ":lcd " . expand("%:p:h")
au MyAutoCmd BufEnter c:/*.{txt,htm,html,css,js,xml,vim,sql,conf,properties} execute ":lcd " . expand("%:p:h")
au MyAutoCmd BufEnter c:/*{.vimrc,.gvimrc,_vimrc,_gvimrc,vimrc,gvimrc,.gitignore} execute ":lcd " . expand("%:p:h")

" Java {{{
"au MyAutoCmd FileType java setlocal omnifunc=javacomplete#Complete
" }}}

" PHP {{{
au MyAutoCmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
" }}}

" Python {{{
au MyAutoCmd FileType python setlocal omnifunc=pythoncomplete#Complete
" }}}

" Scala {{{
au MyAutoCmd BufRead,BufNewFile *.{scala,sbt} set filetype=scala
" }}}

" その他 {{{
au MyAutoCmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au MyAutoCmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
au MyAutoCmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au MyAutoCmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" }}}
" }}}
