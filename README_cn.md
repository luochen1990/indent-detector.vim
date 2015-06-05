Indent Detector
===============

缩进检查器

功能
----

- 自动检查混用（tab和空格）缩进的情况，并提示错误，（在打开文件时和写入文件时）
- 自动切换相关Vim选项以适配当前缩进风格（相关选项有`expandtab` `smarttab` `tabstop` `shiftwidth` `softtabstop`）
- 对检查用时做了限制，所以不必担心打开超大文件会卡顿

注意
----

- 可能被本插件设置的选项有`expandtab` `smarttab` `tabstop` `shiftwidth` `softtabstop`，它们是通过`setlocal`命令设置的。
- 当缩进风格尚未被决定的情况下，你自己的关于缩进的配置是会起作用的。（这些情况包括：创建一个空文件时，或者进入一个没有任何行以空格或tab起始的文件）
- 当你以只读模式打开一个文件的时候，本插件不会做检查。（这样你打开帮助文档的时候就不用看到警告了）

安装
----

### 用Vundle安装

```vim
Bundle 'luochen1990/indent-detector.vim'
```

### 或者手动安装

把`indentdetector.vim`文件放到目录`~/.vim/plugin`或者`vimfiles/plugin`底下就OK了。

>	安装完记得重启Vim再试用

