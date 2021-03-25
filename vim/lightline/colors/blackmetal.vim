let s:black = [ '#000000', 235 ]

let s:gray = [ '#121212', 236 ]

let s:white = [ '#999999', 250 ]

" inactive window
let s:dgray = [ '#555555' , 67 ] 

" insert mode
let s:yellow = [ '#fbcb97', 71 ] 

" normal mode
let s:blue = [ '#5f8787', 104 ] 

" replace
let s:red = [ '#ff6b68', 204 ]

" visual mode
let s:orange = [ '#e78a53', 222 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:black, s:blue ], [ s:white, s:gray ] ]
let s:p.normal.right = [ [ s:black, s:blue ], [ s:blue, s:gray ] ]
let s:p.inactive.left =  [ [ s:black, s:dgray ], [ s:dgray, s:gray ] ]
let s:p.inactive.right = [ [ s:black, s:dgray ], [ s:dgray, s:gray ] ]
let s:p.insert.left = [ [ s:black, s:yellow ], [ s:white, s:gray ] ] 
let s:p.insert.right = [ [ s:black, s:yellow ], [ s:yellow, s:gray ] ]
let s:p.replace.left = [ [ s:black, s:red ], [ s:white, s:gray ] ]
let s:p.replace.right = [ [ s:black, s:red ], [ s:red, s:gray ] ]
let s:p.visual.left = [ [ s:black, s:orange ], [ s:white, s:gray ] ]
let s:p.visual.right = [ [ s:black, s:orange ], [ s:orange, s:gray ] ]
let s:p.normal.middle = [ [ s:white, s:gray ] ]
let s:p.inactive.middle = [ [ s:white, s:gray ] ]
let s:p.tabline.left = [ [ s:dgray, s:gray ] ]
let s:p.tabline.tabsel = [ [ s:black, s:dgray ] ]
let s:p.tabline.middle = [ [ s:dgray, s:gray ] ]
let s:p.tabline.right = [ [ s:black, s:dgray ] ]
let s:p.normal.error = [ [ s:red, s:black ] ]
let s:p.normal.warning = [ [ s:orange, s:black ] ]

let g:lightline#colorscheme#blackmetal#palette = lightline#colorscheme#flatten(s:p)
