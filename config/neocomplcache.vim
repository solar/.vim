
" Neocomplcacheの設定
"

" プラグイン設定 {{{

" Vim起動時にneocomplcacheを有効にするかどうか制御する。 1なら
" ば自動で有効化する。このオプションは.vimrcで設定するべきであ
" る。neocomplcacheは|AutoComplPop|と競合するので、同時に使用
" するべきではない。
" 初期値は0なので、手動で有効にしない限りneocomplcacheは使用で
" きない。
let g:neocomplcache_enable_at_startup = 1

" ポップアップメニューで表示される候補の数を制御する。
" 候補がこれを超えた場合は切り詰められる。
let g:neocomplcache_max_list = 100

" ポップアップメニューで表示される候補の表示幅を制御する。
" これを超えた場合は適当に切り詰められる。
let g:neocomplcache_max_keyword_width = 50

" ポップアップメニューで表示されるファイル名の表示幅を制御する。
" これを超えた場合は切り詰められる。
let g:neocomplcache_max_menu_width = 15

" キー入力時にキーワード補完を行う入力数を制御する。
let g:neocomplcache_auto_completion_start_length = 2

" 手動補完時に補完を行う入力数を制御する。 この値を減らすと便利だが、
" ポップアップ表示時 <C-h> や <BS> などで文字を削除し
" たときに重くなる可能性がある。
let g:neocomplcache_manual_completion_start_length = 2

" バッファや辞書ファイル中で、補完の対象となるキーワードの最小長さを制御する。
let g:neocomplcache_min_keyword_length = 4

" シンタックスファイル中で、補完の対象となるキーワードの最小長さを制御する。
let g:neocomplcache_min_syntax_length = 3

" 補完候補を探すときに、大文字・小文字を無視するかを制御する。1ならば無視する。
let g:neocomplcache_enable_ignore_case = 1

" 入力に大文字が含まれている場合は、大文字・小文字を無視しない
" ようにする。 1ならば有効。初期値は0である。
let g:neocomplcache_enable_smart_case = 1

" 自動補完を無効にするかどうかを制御する。 
" 1ならば自動補完が無効になるが、 <C-x><C-u> による手動補完は使用できる。
" 初期値は0なので、自動補完が有効になっている。
let g:neocomplcache_disable_auto_complete = 0

" 省入力のために、ワイルドカード文字 '*' を容認するかどうかを
" 制御する。 1ならばワイルドカードが使用できる。
" 初期値は1なので、ワイルドカードが有効になっている。
let g:neocomplcache_enable_wildcard = 1

" 候補の計算を|CursorHoldI|イベント時に行うかどうかを制御する。
" このオプションが設定されなかった場合、|CursorMovedI|イベン
" トを使用する。このオプションでは無理矢理タイマーイベントを模
" 倣するので、不具合が生じるかもしれない。加えて、補完時にもた
" つくことがある。
" 副作用があるので、初期値は0である。
let g:neocomplcache_enable_cursor_hold_i = 0

" 補完候補を出すときに、自動的に一番上の候補を選択するかどうか
" を制御する。 このオプションを有効化すると、|AutoComplPop|と
" 似た補完動作となる。
" 初期値は0である。
let g:neocomplcache_enable_auto_select = 0

" neocomplcacheが補完時に自動でデリミタを補完するかどうかを制御す
" る。デリミタとは、ファイル名補完での /やVim scriptでの#である。
" 初期値は0である。
let g:neocomplcache_enable_auto_delimiter = 1

" |g:neocomplcache_enable_cursor_hold_i|が有効になっている場合、
" 自動補完を開始するための計算時間を定義する。このオプションは
" 'updatetime'の値を書き換える。
" 初期値は300である。
let g:neocomplcache_cursor_hold_i_time = 300

" 大文字を入力したときに、それを単語の区切りとしてあいまい検索
" を行うかどうか制御する。 例えば AE と入力したとき、
" ArgumentsException とマッチするようになる。 1ならば有効にな
" る。
" 副作用があるので、初期値は0となっている。
let g:neocomplcache_enable_camel_case_completion = 1

" _を入力したときに、それを単語の区切りとしてあいまい検索を行
" うかどうか制御する。 例えば p_h と入力したとき、 public_html
" とマッチするようになる。 1ならば有効になる。
" 副作用があるので、初期値は0となっている。
let g:neocomplcache_enable_underbar_completion = 1

" キャッシュ中に、メッセージをCommand-lineに表示するかを制御
" する。
" 初期値は1である。
let g:neocomplcache_enable_caching_message = 1

" ファイルをキャッシュするファイルサイズを設定する。 開いたファ
" イルがこのサイズより大きいと自動キャッシュしない。
" 初期値は500000となっている。
let g:neocomplcache_caching_limit_file_size = 500000

" g:neocomplcache_disable_caching_file_path_pattern
"
" キャッシュを保存しないバッファのファイルパスのパターンを正規表
" 現で設定する。空文字列だと無視される。
"
" 初期値は空となっている。
let g:neocomplcache_disable_caching_file_path_pattern = ''

" neocomplcacheの自動補完を無効化するバッファ名のパターンを正規表
" 現で設定する。空文字列だと無視される。
" 初期値は空となっている。
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" neocomplcacheが'readonly'や'nomodifiable'を無視して強制的にキャ
" ッシュするバッファ名のパターンを正規表現で設定する。空文字列だ
" と無視される。
" 初期値は空となっている。
let g:neocomplcache_force_caching_buffer_name_pattern = ''

" |g:neocomplcache_enable_auto_select|による候補の自動選択を無効
" 化するバッファ名のパターンを正規表現で設定する。空文字列だと無
" 視される。
" 初期値は空となっている。
let g:neocomplcache_disable_auto_select_buffer_name_pattern = ''

" ユーザが定義したスニペット補完ファイルのパスを指定する。 カ
" ンマ区切りで複数のディレクトリを設定可能。 ここで指定したディ
" レクトリが実際に存在しない場合、無視される。 ユーザ定義のス
" ニペット補完ファイルは標準のスニペット補完ファイルを読み込ん
" だ後に読み込まれる。 重複したスニペットは上書きされる。
" この変数はユーザが自分で定義しない限り存在しない。
let g:neocomplcache_snippets_dir = expand("~/.vim/snippets")

" neocomplcacheが一時ファイルを書き出すディレクトリを指定する。
" ここで指定したディレクトリが実際に存在しない場合、作成される。
" 例えばkeyword_complete.vimはキーワードのキャッシュをこの下の
" 'keyword_cache'ディレクトリに保存する。
" 初期値は'~/.neocon'である。
let g:neocomplcache_temporary_dir = expand("~/.neocon")

" 補完するためのキーワードパターンを記録する。 これはファイル
" タイプ毎に正規表現で指定されている。
" 初期値は複雑なので、autoload/neocomplcache.vimのneocomplcache#enable()を参照せよ。
" >
" " Examples:
" if !exists('g:neocomplcache_keyword_patterns')
" let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" <
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif

" カーソルより後のキーワードパターンを認識するための正規表現を記録する。
" |g:neocomplcache_keyword_patterns|と形式は同じである。

" 初期値は複雑なので、autoload/neocomplcache.vimのneocomplcache#enable()を参照せよ。
if !exists('g:neocomplcache_next_keyword_patterns')
    let g:neocomplcache_next_keyword_patterns = {}
endif

" g:neocomplcache_omni_patterns *g:neocomplcache_omni_patterns*
" オムニ補完するためのキーワードパターンを記録する。これはファ
" イルタイプ毎に正規表現で指定されている。これが定義されていない場合、
" 自動補完ではオムニ補完がよばれない。RubyやPHPのオムニ補完は重い
" ので、パターンは無効化されている。
" 初期値は複雑なので、autoload/neocomplcache/sources/omni_complete.vimの
" s:source.initialize()を参照せよ。
" >
" " Examples:
" if !exists('g:neocomplcache_omni_patterns')
" let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
" let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" <
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" g:neocomplcache_tags_filter_patterns *g:neocomplcache_tags_filter_patterns*
" タグ補完時の候補をフィルタするパターンを記録する。
" 例えば、C/C++のファイルタイプ時に_で始まる候補を除外することができる。
" 初期値は複雑なので、autoload/neocomplcache.vimのneocomplcache#enable()を参照せよ。
if !exists('g:neocomplcache_tags_filter_patterns')
    let g:neocomplcache_tags_filter_patterns = {}
endif

" ファイルタイプを相互に関連づけるためのディクショナリ。 cと
" cppを相互参照させるときなどに有効である。
" 初期値は複雑なので、autoload/neocomplcache.vimのneocomplcache#enable()を参照せよ。
if !exists('g:neocomplcache_same_filetype_lists')
    let g:neocomplcache_same_filetype_lists = {}
endif

" ファイルタイプに辞書ファイルを関連づけるためのディクショナリ。
" キーにファイルタイプ、値に辞書ファイルへのパスを指定する。
" ','区切りで複数の辞書を指定できる。もしこの変数が空の場合、
" neocomplcacheは'dictionary'を代わりに使用する。
" キーに"text"を指定すると、text mode時の辞書を指定することとなる。
" 初期値は空である。
if !exists('g:neocomplcache_dictionary_filetype_lists')
    let g:neocomplcache_dictionary_filetype_lists = {}
endif

" g:neocomplcache_filetype_include_lists *g:neocomplcache_filetype_include_lists*
" ファイルタイプに内包される別のファイルタイプを定義する。
" 中身はディクショナリのリストであり、次の内容を持つ。
" "filetype" : 内包されるファイルタイプ名
" "start" : ファイルタイプが初まるパターン
" "end" : ファイルタイプが終わるパターン。startのマッチパター
" ンを参照するために、\1を使うことができる。
" >
" " Examples:
" if !exists('g:neocomplcache_filetype_include_lists')
" let g:neocomplcache_filetype_include_lists= {}
" endif
" let g:neocomplcache_filetype_include_lists.perl6 = [{'filetype' : 'pir', 'start' : 'Q:PIR\s*{', 'end' : '}'}]
" let g:neocomplcache_filetype_include_lists.vim =
" \[{'filetype' : 'python', 'start' : '^\s*python <<\s*\(\h\w*\)', 'end' : '^\1'}]
" <
" 初期値は複雑なので、autoload/neocomplcache.vimのneocomplcache#enable()を参照せよ。
if !exists('g:neocomplcache_filetype_include_lists')
    let g:neocomplcache_filetype_include_lists = {}
endif

" g:neocomplcache_text_mode_filetypes *g:neocomplcache_text_mode_filetypes*
" 自動的にテキストモードとなるファイルタイプをキーとした
" ディクショナリである。neocomplcacheがテキストモードのとき、
" 英語を書き易くするための支援機能が有効となる。
" 初期値は複雑なので、autoload/neocomplcache.vimのneocomplcache#enable()を参照せよ。
if !exists('g:neocomplcache_text_mode_filetypes')
    let g:neocomplcache_text_mode_filetypes = {}
endif

" g:neocomplcache_disable_select_mode_mappings *g:neocomplcache_disable_select_mode_mappings*
" snippets_completeが行うSelect modeのKey-mappingsを無効にする
" かどうかを制御する。 通常は有効にしておいた方がよい。
" 初期値は1である。
let g:neocomplcache_disable_select_mode_mappings = 1

" g:neocomplcache_ctags_program *g:neocomplcache_ctags_program*
" include_completeなどがタグ生成に使用するctagsコマンドへのパスを指定する。

" 初期値は"ctags"である。
let g:neocomplcache_ctags_program = "ctags"

" g:neocomplcache_ctags_arguments_list *g:neocomplcache_ctags_arguments_list*
" include_completeなどがctagsコマンドを使用する際に、コマンドの
" 引数として与える値を設定するための、ファイルタイプをキーと
" した文字列の辞書である。
" 初期値は複雑なので、autoload/neocomplcache.vimのneocomplcache#enable()を参照せよ。
if !exists('g:neocomplcache_ctags_arguments_list')
    let g:neocomplcache_ctags_arguments_list = {}
endif

" g:neocomplcache_include_paths *g:neocomplcache_include_paths*
" インクルードファイルのpathをファイルタイプごとに列挙する変数
" である。存在しない場合、&l:pathが使われる。 記述形式は'path'
" を参照せよ。ファイルタイプをキーとした文字列の辞書である。
" 初期値は複雑なので、autoload/neocomplcache/sources/include_complete.vimの
" neocomplcache#sources#include_complete#initialize()を参照せよ。
if !exists('g:neocomplcache_include_paths')
    let g:neocomplcache_include_paths = {}
endif

" g:neocomplcache_include_exprs *g:neocomplcache_include_exprs*
" インクルードファイル名を取得するために行う行解析の式である。
" 存在しない場合、&l:includeexprが使われる。 記述形式は
" 'includeexpr'を参照せよ。ファイルタイプをキーとした文字列の
" 辞書である。
" 初期値は複雑なので、autoload/neocomplcache/sources/include_complete.vimの
" s:source.initialize()を参照せよ。
if !exists('g:neocomplcache_include_exprs')
    let g:neocomplcache_include_exprs = {}
endif

" g:neocomplcache_include_patterns *g:neocomplcache_include_patterns*
" インクルード命令のパターンを指定する。存在しない場合、
" &l:includeが使われる。 記述形式は'include'を参照せよ。ファイ
" ルタイプをキーとした文字列の辞書である。
" 初期値は複雑なので、autoload/neocomplcache/sources/include_complete.vimの
" s:source.initialize()を参照せよ。
if !exists('g:neocomplcache_include_patterns')
    let g:neocomplcache_include_patterns = {}
endif

" g:neocomplcache_member_prefix_patterns *g:neocomplcache_member_prefix_patterns*
" include_completeやtags_complete,
" buffer_completeがメンバを認識するための
" パターンを記録する。これはファイルタイプ毎に正規表現で指定
" されている。
" 初期値は複雑なので、autoload/neocomplcache.vimのneocomplcache#enable()を参照せよ。
if !exists('g:neocomplcache_member_prefix_patterns')
    let g:neocomplcache_member_prefix_patterns = {}
endif

" g:neocomplcache_delimiter_patterns *g:neocomplcache_delimiter_patterns*
" 関数をスマートに補完するための区切り文字パターンを定義する。
" これはファイルタイプ毎に正規表現のリストで指定されている。
" >
" " Examples:
" if !exists('g:neocomplcache_delimiter_patterns')
" let g:neocomplcache_delimiter_patterns= {}
" endif
" let g:neocomplcache_delimiter_patterns.vim = ['#']
" let g:neocomplcache_delimiter_patterns.cpp = ['::']
" <
" 初期値は複雑なので、autoload/neocomplcache.vimのneocomplcache#enable()を参照せよ。
if !exists('g:neocomplcache_delimiter_patterns')
    let g:neocomplcache_delimiter_patterns = {}
endif

" g:neocomplcache_quick_match_patterns *g:neocomplcache_quick_match_patterns*
" クイックマッチリストを表示する入力パターンを記録する。 これ
" はファイルタイプ毎に入力文字列の末尾にマッチする正規表現で指
" 定されている。 defaultを指定すると、通常時の入力パターンを設
" 定できる。
"
" 初期値は { 'default' : '-' } である。
"
" g:neocomplcache_quick_match_table *g:neocomplcache_quick_match_table*
" 入力文字と対応する、クイックマッチリストの補完候補のテーブルである。
"
" 初期値は複雑なので、plugin/neocomplcache.vimを参照せよ。
if !exists('g:neocomplcache_quick_match_patterns')
    let g:neocomplcache_quick_match_patterns = {}
endif

" g:neocomplcache_omni_functions *g:neocomplcache_omni_functions*
" |&filetype|をキーとしたディクショナリであり、|omni_complete|
" が呼び出すオムニ補完関数を定義する。 |&filetype|に対応する関
" 数が定義されていないとき、|omni_complete|は|omnifunc|を呼び
" 出す。
"
" 初期値は空である。
if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
endif

" g:neocomplcache_vim_completefuncs *g:neocomplcache_vim_completefuncs*
" コマンド名をキーとして、補完関数名を値としたディクショナリ変
" 数である。 |vim_complete|において、
" |command-completion-custom|や|command-completion-customlist|
" のコマンド引数を補完するために使用される。
" >
" " Examples:
" if !exists('g:neocomplcache_vim_completefuncs')
" let g:neocomplcache_vim_completefuncs = {}
" endif
" let g:neocomplcache_vim_completefuncs.Ref = 'ref#complete'
" <
"
" 初期値は空である。
if !exists('g:neocomplcache_vim_completefuncs')
    let g:neocomplcache_vim_completefuncs = {}
endif

" g:neocomplcache_plugin_disable *g:neocomplcache_plugin_disable*
" プラグインを無効にするかどうかを指定するディクショナリ。プラ
" グイン名をキーにして、値を1にすることで無効になる。
"
" 初期値は空である。
if !exists('g:neocomplcache_plugin_disable')
    let g:neocomplcache_plugin_disable = {}
endif

" g:neocomplcache_plugin_completion_length *g:neocomplcache_plugin_completion_length*
" プラグインを呼び出す文字数をプラグインごとに指定するディクショ
" ナリ。 重いプラグインは文字数が多いときにのみ呼び出せるよう
" にするなどが考えられる。
"
" 初期値は空である。
if !exists('g:neocomplcache_plugin_completion_length')
    let g:neocomplcache_plugin_completion_length = {}
endif

" g:neocomplcache_plugin_rank *g:neocomplcache_plugin_rank*
" プラグインの優先度を指定するディクショナリ。
"
" 初期値はそれぞれのプラグインによってセットされる。
if !exists('g:neocomplcache_plugin_rank')
    let g:neocomplcache_plugin_rank = {}
endif

" }}}

" キーマッピング {{{

imap <expr><C-l>	neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<C-n>" : "\<C-l>")
smap <expr><C-l>	neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<C-n>" : "\<C-l>")

inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-c> neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

nnoremap <Space>ne :<C-u>NeoComplCacheEnable<CR>
nnoremap <Space>ns :<C-u>NeoComplCacheEditSnippet<CR>

"}}}
