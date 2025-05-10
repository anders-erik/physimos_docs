
# Docs Documentation

<br>

# Table of Contents
1. [Building docs](#1-building-docs)
    - [TeX Auxillary files](#tex-auxillary-files)
    - [TeX to HTML](#tex-to-html)
    - [TeX to pdf](#tex-to-pdf)
    - []()

<br>

# 1. Building docs

## TeX Auxillary files

### [Which to keep in version control](https://tex.stackexchange.com/questions/17845/which-auxiliary-latex-files-should-be-ignored-by-version-control-software)



## TeX to HTML


### Basic Build command
```
htlatex physimos_component.tex "xhtml,mathjax"
```

### CSS overview

- Table := `#TBL-X`
- Formatting := `class="Latex-formtting"`
- Equations := MathJax support

- NOTE: is wrapped in a comment referencing a string found in '.tmp' file


### HTML overview

- TeX4ht (TeX to hypertext generator package) generated 
- keeps the local image path from tex source
- overall a straightforawrd html file buth with a lot of css naming related to TeX keywords.
- depends on MathJax and tries to fetch from `cdn.jsdelivr.net`
```
<script type="text/javascript" async="async" id="MathJax-script" src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml-full.js"></script>
```


**NOTE**: images are currently being translated to the html file as the local path during build. This needs to be converted to a path relative to the hosted html file. A good solution would be to copy al relevant images to the build directory, then copy those images with the html/css during deployment. 


### Output files

I can remove all but the 'needed' output files.


#### Needed
- .html
- .css 


#### Debug
- .aux -> (See under TeX to pdf)
- .log -> (See under TeX to pdf)

#### Used by packages 

- .4tc, .4ct = [Probably just internal files from tex4ht](https://stackoverflow.com/questions/3318733/whats-the-relation-of-file-4ct-and-file-4tc-generated-by-miktexs-latex-exe)
- .idv = ["a dvi file extracted from x.dvi, and it contains the pictures needed in the html files."](https://www.tug.org/tex4ht/doc/mn39.html)
- .lg = ["This is a log file listing the pictures of x.idv"](https://www.tug.org/tex4ht/doc/mn39.html)

- .dvi = [Device independent format of processed TeX file](https://en.wikipedia.org/wiki/Device_independent_file_format)
- .tmp = [maybe referenced in make4ht source?](https://github.com/michal-h21/make4ht/blob/master/make4ht-aeneas-config.lua), and because the contents in .tmp is used in the css file generated tex4ht, tex4ht is definitely, at the very least, using this file.
- .xref = Some cross referencing file
    - [found use here](https://www.tug.org/tex4ht/doc/mn39.html)
    - [maybe here too](https://tex.stackexchange.com/questions/438986/what-does-couldnt-read-xref-table-mean)


## TeX to pdf

```
pdflatex physimos_component.tex
```

### Output files
- .aux
    - [aux usage](https://tex.stackexchange.com/questions/47943/how-to-use-the-aux-file)
        > If you want to know what is in the aux-file: Open it in an editor and look it up. Actually every package (and you too) can write something to the aux-file if it want. So the aux-file normally contains quite a lot informations which are very document specific and which would cause troubles in another document.
- .log
    - [understanding the log file](https://tex.stackexchange.com/questions/32213/understanding-the-log-file)

