" local.vim - Local
" Maintainer: Ivan Lopes

let g:neomake_clean_maker = {
      \ 'exe': 'make',
      \ 'args': ['clean']
      \ }
let g:neomake_run_maker = {
      \ 'exe': 'make',
      \ 'args': ['run']
      \ }
let g:neomake_message_maker = {
      \ 'exe': 'make',
      \ 'args': ['message']
      \ }

map <F9>  :Neomake!<CR>:echomsg "Build!"<CR>
map <F10> :Neomake! clean<CR>:echomsg "Clean!"<CR>
" vim: fdm=marker:sw=2:sts=2:et
