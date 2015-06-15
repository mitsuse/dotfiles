"" standard vim commands
nnoremap ;; q:a
nnoremap / q/a
nnoremap ;h :help<space>
nnoremap ;t :tabnew<space>
nnoremap ;w :w
nnoremap ;q :q
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap <C-a> :set spell!<CR>
nmap <silent> <Esc><Esc> :nohlsearch<CR>

"" unite
nnoremap zn :UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap zp :UniteWithProjectDir -buffer-name=file file file/new<CR>
nnoremap zb :Unite -buffer-name=bookmark bookmark<CR>
nnoremap zh :Unite -buffer-name=files file file_mru file/new locate<CR>
nnoremap zo :Unite -buffer-name=outline outline<CR>
nnoremap zm :Unite -buffer-name=dwm dwm<CR>

"" sonictemplate-vim
nnoremap ;g :Template<space>

"" quickrun
nnoremap ;r :QuickRun -outputter/buffer/split ":botright 8sp"<CR>

"" vim-go
nnoremap <C-x>m :GoImport<space>
