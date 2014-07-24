"
" Unite settings
"
let g:unite_enable_start_insert = 1
let g:unite_winheight = 32
let g:unite_data_directory = expand("~/.unite")

let g:user_grep_targets = get(g:, 'user_grep_targets', [])

" キーマッピング
nnoremap [unite] <Nop>
nmap ' <SID>[unite]
nnoremap <SID>[unite]u :<C-u>Unite
nnoremap <SID>[unite]' :<C-u>Unite buffer file<CR>
nnoremap <SID>[unite]b :<C-u>Unite buffer<CR>
nnoremap <SID>[unite]f :<C-u>Unite file<CR>
nnoremap <SID>[unite]t :<C-u>Unite tag<CR>
nnoremap <SID>[unite]w :<C-u>Unite tab<CR>
nnoremap <SID>[unite]m :<C-u>Unite file_mru<CR>
nnoremap <SID>[unite]o :<C-u>Unite outline<CR>
nnoremap <SID>[unite]q :<C-u>Unite qf -no-quit<CR>
nnoremap <SID>[unite]M :<C-u>Unite mark<CR>
nnoremap <SID>[unite]r :<C-u>Unite register<CR>
nnoremap <SID>[unite]g :<C-u>Unite grep -no-quit -direction=botright -buffer-name=grep-buffer<CR>
nnoremap <SID>[unite]G :<C-u>call unite#start([['grep', g:user_grep_targets]], {'no-quit': 1, 'direction': 'botright', 'buffer-name': 'grep-buffer'})

" source設定
" file
let g:unite_source_file_ignore_pattern = 
      \'^\%(/\|\a\+:/\)$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$'

" file_mru
let g:unite_source_file_mru_limit = 100

" mark
let g:unite_source_mark_marks = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""

" grep
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup ' .
                \ '--hidden --ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'' ' .
                \ '--ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
endif

" unite filetype
au MyAutoCmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    " Overwrite settings.
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)

    " <C-l>: manual neocomplcache completion.
    " inoremap <buffer> <C-l> <C-x><C-u><C-p><Down>
endfunction
"
