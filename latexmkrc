### For e-book/HTML creation, switch the compiler to pdfLaTeX and choose one method:
#### 1) tex4ebook [default option],
#### 2) tex4ebook with epub3 output [nice math output, but might be incompatible with some devices], or 
#### 3) make4ht [single HTML file, no table of contents]

END {
### 1) EPUB generation with tex4ebook (default). 
# system("tex4ebook -j output -c htlatex/enumerate-fix main");

### 2) Use this if you want to try generating MathML. It might not render nicely in all ePub readers.
# system("tex4ebook -j output -f epub3 -c htlatex/enumerate-fix main");

### 3) Fallback alternative: EPUB generation with make4ht. Note that this does NOT update the table of contents automatically, you have to make the necessary changes in the /OEBPS/nav.xhtml if you want the table of contents to show up in the Kindle or EPUB reader. Uncomment all calls for this to work. 
# system('make4ht -j output -uf xhtml -c htlatex/htlatex.cfg main "htm,mathjax,p-width,charset=utf-8" " -cunihtf -utf8"');
# system('cp -r images OEBPS');
# system('mkdir OEBPS/tikz-cache');
# system('cp tikz-cache/*.jpg OEBPS/tikz-cache/');
# system('cp *.css OEBPS/');
# system('cp *.htm OEBPS/');
# system('zip -X -0 output.epub mimetype');
# system('zip -X -0 -ru output.epub META-INF');
# system('zip -X -0 -ru output.epub OEBPS');


# This command creates a zip file containing the HTML file and images.
system('zip -r allfiles.zip .');

### Finally, cleaning up tikz PDF files so that they are regenerated during the next compilation.
system('rm tikz-cache/*.pdf');
}