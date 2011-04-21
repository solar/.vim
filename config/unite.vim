"
" Unite settings
"

" グローバル {{{
let g:unite_enable_start_insert = 1
let g:unite_winheight = 32
let g:unite_data_directory = expand("~/.unite")
" }}}

" キーマッピング {{{
nmap ' [unite]
noremap [unite]u :Unite
nnoremap [unite]' :Unite buffer file<CR>
nnoremap [unite]b :Unite buffer<CR>
nnoremap [unite]f :Unite file<CR>
nnoremap [unite]t :Unite tab<CR>
nnoremap [unite]m :Unite file_mru<CR>
nnoremap [unite]o :Unite outline<CR>
nnoremap [unite]q :Unite qf -no-quit<CR>
nnoremap [unite]M :Unite mark<CR>
nnoremap [unite]r :Unite register<CR>
nnoremap [unite]g :Unite grep<CR>
" }}}

" source設定 {{{
" file
let g:unite_source_file_ignore_pattern = 
      \'^\%(/\|\a\+:/\)$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$'

" file_mru
let g:unite_source_file_mru_limit = 100

" mark
let g:unite_source_mark_marks = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""
" }}}

" unite ファイルタイプ設定 {{{
au MyAutoCmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    " Overwrite settings.
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)

    " <C-l>: manual neocomplcache completion.
    inoremap <buffer> <C-l> <C-x><C-u><C-p><Down>
endfunction
" }}}
