"Script Title: Indent Detector
"Script Version: 0.0.2
"Author: luochen1990
"Last Edited: 2015 June 5

if exists('s:loaded')
	finish
else
	let s:loaded = 1
endif

func indentdetector:search_nearby(pat)
	return search(a:pat, 'Wnc', 0, 20) > 0 || search(a:pat, 'Wnb', 0, 20) > 0
endfunc

func indentdetector:detect(autoadjust)
	let leadtab = indentdetector:search_nearby('^\t')
	let leadspace = indentdetector:search_nearby('^ ')
	if leadtab + leadspace < 2 && indentdetector:search_nearby('^\(\t\+ \| \+\t\)') == 0
		if leadtab
			if a:autoadjust
				setl noexpandtab nosmarttab tabstop=4 shiftwidth=4 softtabstop=4
			endif
			return 'tab'
		elseif leadspace
			let spacenum = 0
			if indentdetector:search_nearby('^ [^\t ]')
				let spacenum = 1
			elseif indentdetector:search_nearby('^  [^\t ]')
				let spacenum = 2
			elseif indentdetector:search_nearby('^   [^\t ]')
				let spacenum = 3
			elseif indentdetector:search_nearby('^    [^\t ]')
				let spacenum = 4
			endif
			if a:autoadjust
				let n = spacenum ? spacenum : 4
				exec 'setl expandtab smarttab tabstop='.n.' shiftwidth='.n.' softtabstop='.n
			endif
			return 'space * '.(spacenum ? spacenum : '>4')
		else
			return 'default'
		endif
	else
		return 'mixed'
	endif
endfunc

func indentdetector:hook()
	let rst = indentdetector:detect(1)
	if &readonly == 0
		if rst == 'mixed'
			echohl ErrorMsg | echom 'mixed indent' | echohl None 
		elseif rst[0] == 's' "space
			if rst[8] == '>' "too many
				echohl WarningMsg | echom 'too many leading spaces here.' | echohl None 
			else
				echo 'indent: '.rst
			endif
		endif
	endif
endfunc

auto bufenter,bufwritepost * call indentdetector:hook()
