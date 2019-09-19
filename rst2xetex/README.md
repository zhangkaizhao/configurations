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

----

Note: Header/Footer in LaTeX with Fancyhdr

If Header/Footer for each page is not needed, comment out or remove the first three lines in file `docutils.tex` :

```tex
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyfoot{}
```

References:

* [Header/Footer in LaTeX with Fancyhdr](https://texblog.org/2007/11/07/headerfooter-in-latex-with-fancyhdr/)
* [LaTeX/Customizing Page Headers and Footers](https://en.wikibooks.org/wiki/LaTeX/Customizing_Page_Headers_and_Footers)
