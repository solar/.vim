"
" Unite settings
"

" キーマッピング
nnoremap [unite] <Nop>
nmap ' <SID>[unite]
nnoremap <SID>[unite]u :<C-u>Unite
nnoremap <SID>[unite]' :<C-u>Unite buffer file<CR>
nnoremap <SID>[unite]b :<C-u>Unite buffer<CR>
nnoremap <SID>[unite]H :<C-u>Unite help<CR>
nnoremap <SID>[unite]t :<C-u>Unite tag<CR>
nnoremap <SID>[unite]T :<C-u>Unite -immediately -no-start-insert tag:<C-r>=expand('<cword>')<CR><CR>
nnoremap <SID>[unite]w :<C-u>Unite tab<CR>

nnoremap <silent> <SID>[unite]f
            \ :<C-u>UniteWithProjectDir -buffer-name=files -no-split
            \ jump_point file_point buffer
            \ file_rec/async file file/new<CR>

nnoremap <silent> <SID>[unite]x :<C-u>Unite output:message<CR>

if g:is_windows
    nnoremap <SID>[unite]m :<C-u>Unite file_mru everything/async -start-insert<CR>

else
    nnoremap <SID>[unite]m :<C-u>Unite file_mru -start-insert<CR>
endif

nnoremap <SID>[unite]o :<C-u>Unite outline<CR>
nnoremap <SID>[unite]q :<C-u>Unite qf -no-quit<CR>
nnoremap <SID>[unite]M :<C-u>Unite mark<CR>
nnoremap <SID>[unite]r :<C-u>Unite register<CR>
nnoremap <SID>[unite]g :<C-u>Unite grep -no-quit -direction=botright -buffer-name=grep-buffer<CR>
nnoremap <SID>[unite]G :<C-u>call unite#start([['grep', unite#util#path2project_directory('%')]],
            \ {'no_quit': 1, 'direction': 'botright', 'buffer-name': 'grep-buffer'})<CR>
nnoremap <SID>[unite]W :<C-u>Unite tweetvim<CR>

" unite filetype
au MyAutoCmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    " Overwrite settings.
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
endfunction

" Unite初期起動時
let s:bundle = neobundle#get('unite.vim')
function! s:bundle.hooks.on_source(bundle)
    let g:unite_enable_start_insert = 1
    let g:unite_winheight = 32
    let g:unite_data_directory = expand("~/.unite")

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

        let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
    elseif executable('ack')
        let g:unite_source_grep_command = 'ack'
        let g:unite_source_grep_default_opts = '--no-heading --no-color -k -H'
        let g:unite_source_grep_recursive_opt = ''
    endif

    " unite-tag
    let g:unite_source_tag_max_name_length = 25
    let g:unite_source_tag_max_fname_length = 130

    " unite-everything
    let g:unite_source_everything_limit = 10000
    let g:unite_source_everything_full_path_search = 1
    let g:unite_source_everything_ignore_pattern =
                \'\%(^\|/\)\.\.\?$\|\~$\|\.\%(git\|hg\|svn\|neocon\|cache\)\|\$Recycle\.Bin\|\.\%(o\|exe\|dll\|bak\|DS_Store\|pyc\|zwc\|sw[po]\|class\)$\|build\/intermediates'
endfunction
