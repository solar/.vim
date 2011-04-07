"
" Git-Vim settings
"

if has('unix')
    let g:git_bin = 'git'
else
    let g:git_bin = 'c:/tools/git/bin/git.exe'
endif
let g:git_no_map_default = 1
let g:git_command_edit = 'rightbelow vnew'

nnoremap <Space>gd :<C-u>GitDiff --cached<CR>
nnoremap <Space>gD :<C-u>GitDiff<CR>
nnoremap <Space>gs :<C-u>GitStatus<CR>
nnoremap <Space>gl :<C-u>GitLog<CR>
nnoremap <Space>gL :<C-u>GitLog -u \| head -10000<CR>
nnoremap <Space>ga :<C-u>GitAdd<CR>
nnoremap <Space>gA :<C-u>GitAdd <cfile><CR>
nnoremap <Space>gc :<C-u>GitCommit<CR>
nnoremap <Space>gC :<C-u>GitCommit --amend<CR>
nnoremap <Space>gp :<C-u>Git push<CR>
