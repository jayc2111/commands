#!/bin/bash

list=$(find . -iname '*.heic')


for it in $list; do
    convert -density 100x100 -quality 60 -compress jpeg -resize 45% $it ${it%.heic}.png
    img2pdf --pagesize A4 ${it%.heic}.png -o ${it%.heic}.pdf
    
#     read -p "---" $dummy
    
    rm ${it%.heic}.png
done

gs -q -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=merged.pdf *.pdf

## minimize
## https://askubuntu.com/questions/207447/how-to-reduce-the-size-of-a-pdf-file
# gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -r300 -sOutputFile=output.pdf Wohngebäude_Clemens.pdf
