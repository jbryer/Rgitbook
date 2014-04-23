


# Citations

`Rgitbook` uses the `knitcitations` (<a href="http://CRAN.R-project.org/package=knitcitations">Boettiger, 2014</a>) to manage citations. You can use the `citep` and `citet` functions using the knitr inline syntax. For example:


	The devtools ` r citep(bib['devtools']) ` package makes it easy to develop R packages.


The `Rgitbook` will make a knitcitations bibliography object named `bib` available to all `.Rmd` files being processed. This file contains all the citations in the `references.bib` BibTeX file. 
