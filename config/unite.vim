"
" Unite settings
"

" デフォルトでインサートモードにはしない
let g:unite_enable_start_insert = 0
let g:unite_winheight = 32

let g:unite_data_directory = expand("~/.unite")

" The prefix key.
"nnoremap [unite]
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

" file_mru
let g:unite_source_file_mru_limit = 100

" mark
let g:unite_source_mark_marks = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""
