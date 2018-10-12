library(rmarkdown)
rmarkdown::render('all.Rmd',
                  output_format='pdf_document',
                  output_file='all.pdf',
                  quiet=TRUE)

