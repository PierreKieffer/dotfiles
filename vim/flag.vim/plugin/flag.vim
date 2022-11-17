autocmd BufEnter * call flag#RetrieveFlags()

if exists("g:loaded_flag")
    finish
endif
let g:loaded_flag = 1

" Define flags
sign define FlagDefault text=● linehl=DiffAdd texthl=String
sign define FlagGreen text=● linehl=DiffAdd texthl=String
sign define FlagYellow text=● linehl=DiffChange texthl=Todo
sign define FlagOrange text=● linehl=LightlineLeft_normal_tabsel texthl=Ctrlp
sign define FlagRed text=● linehl=DiffDelete texthl=ALEErrorSign


" Define maps
nnoremap mg :silent call flag#Flag("green")<CR>
nnoremap my :silent call flag#Flag("yellow")<CR>
nnoremap mo :silent call flag#Flag("orange")<CR>
nnoremap mr :silent call flag#Flag("red")<CR>

nnoremap dmg :silent call flag#DelFlag("green")<CR>
nnoremap dmy :silent call flag#DelFlag("yellow")<CR>
nnoremap dmo :silent call flag#DelFlag("orange")<CR>
nnoremap dmr :silent call flag#DelFlag("red")<CR>

nnoremap Mg :silent call flag#GoToFlag("green")<CR>
nnoremap My :silent call flag#GoToFlag("yellow")<CR>
nnoremap Mo :silent call flag#GoToFlag("orange")<CR>
nnoremap Mr :silent call flag#GoToFlag("red")<CR>

