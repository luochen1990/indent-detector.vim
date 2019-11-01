Indent Detector
===============

[这里有中文说明](https://github.com/luochen1990/indent-detector.vim/blob/master/README_cn.md)

features
--------

- detect mixed indent(indent with both spaces and tabs) and echo warnning on `bufEnter` and `bufWrite` automatically.
- switch setting about indenting to fit the current indenting style automatically.
- detecting time is limited, so you don't need to worry about opening huge files.

note
----

- the options decided by this plugin are `expandtab` `smarttab` `tabstop` `shiftwidth` `softtabstop`, and is setted via `setlocal`.
- your own setting about indenting is also used as default when the indenting style is not decided. (when you create an empty file or enter a file which occurs no leading spaces or tabs)
- this plugin will do nothing when you open an readonly file (`:echo &readonly` to check that), so that you can open help files without warnning.

install
-------

### via Vundle:

```vim
Bundle 'luochen1990/indent-detector.vim'
```

### manually

put `indentdetector.vim` to directory `~/.vim/plugin` or `vimfiles/plugin`

>	remenber to restart your vim after installation

settings
-------

- `let g:indent_detector_tabstop=` - set tabstop, default is global tabstop settings
- `let g:indent_detector_shiftwidth=` - set shiftwidth, default is global shiftwidth settings
- `let g:indent_detector_softtabstop=` - set softtabstop, default is global softtabstop settings
- `let g:indent_detector_echolevel_enter=` - default is 3
- `let g:indent_detector_echolevel_write=` - default is 2

> echolevel: 0 - none; 1 - error; 2 - warnning; 3 - info (all)

