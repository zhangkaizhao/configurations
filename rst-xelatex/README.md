# reStructuredText -> XeTex -> PDF

via https://www.zlovezl.cn/articles/restructuredtext-to-pdf/

Required:

* [docutils](http://docutils.sourceforge.net/)
* [TexLive](http://tug.org/texlive/)

For chinese, e.g. using **Source Han Sans** and **Source Han Serif** fonts:

```sh
ln -sf docutils-source-han.tex docutils.tex
```

reStructuredText to XeTex:

```sh
rst2xetex doc.rst doc.tex
```

XeTex to PDF:

```sh
xelatex doc.tex
```
