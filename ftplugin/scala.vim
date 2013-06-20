setl errorformat=%E\ %#[error]\ %#%f:%l:\ %m,%-Z\ %#[error]\ %p^,%-C\ %#[error]\ %m
setl errorformat+=,%W\ %#[warn]\ %#%f:%l:\ %m,%-Z\ %#[warn]\ %p^,%-C\ %#[warn]\ %m
setl errorformat+=,%-G%.%#

nnoremap <silent> <Space>qf :<C-u>execute 'cfile ' . findfile("target/quickfix/sbt.quickfix", ";")<CR>
