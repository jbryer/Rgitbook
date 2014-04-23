#' Initializes a new Gitbook.
#'
#' This will initalize a new Gitbook in the given directory. When done, it will
#' also change the working directory.
#' 
#' @param dir location of the built gitbook.
#' 
#' @export
newGitbook <- function(dir) {
	# TODO: May want to make these parameters or options
	bookignore <- c('*.RMD','*.rmd','*.Rmd','log/','*.R','*.Rproj','.rmdbuild')
	gitignore <- c('.Rproj.user','_book/','.rmdbuild','*.DS_Store','log/','.Rhistory')
	summary.md <- c("# Summary","This is the summary of my book.",
					"",
					"* [section 1](section1/README.md)",
					"    * [example 1](section1/example1.md)",
					"    * [example 2](section1/example2.md)",
					"* [section 2](section2/README.md)",
					"    * [example 1](section2/example1.md)")
	readme.md <- c("# Book Title",
				   "#### by Your Name",
				   "",
				   "Replace with an introduction of your book.")
	references.rmd <- c("# References",
						"",
						"```{r setup, echo=FALSE, results='hide', message=FALSE, warning=FALSE}",
						"# Uncomment to list all items in the BibTeX file.",
						"#for(i in names(bib)) { print(i); citep(bib[i]) }",
						"```",
						"```{r bibliography, echo=FALSE, results='asis'}",
						"bibliography()",
						"```")
	
	if(missing(dir)) { stop('dir parameter is required.') }
	checkForGitbook(quiet=TRUE)
	
	dir <- path.expand(dir)
	message(paste0('Creating ', dir))
	dir.create(dir, recursive=TRUE, showWarnings=FALSE)
	olddir <- setwd(dir)
	
	message('Writing .bookignore...')
	f <- file('.bookignore')
	writeLines(bookignore, f)
	close(f)
	
	message('Writing .gitignore...')
	f <- file('.gitignore')
	writeLines(gitignore, f)
	close(f)
	
	message('Writing README.md...')
	f <- file('README.md')
	writeLines(readme.md, f)
	close(f)
	
	message('Writing SUMMARY.md...')
	f <- file('SUMMARY.md')
	writeLines(summary.md, f)
	close(f)
	
	message('Writing references.rmd...')
	f <- file('references.Rmd')
	writeLines(references.rmd, f)
	close(f)
	
	message('Writing references.bib...')
	gitbook.ref <- bibentry(
		bibtype = "Manual",
		title = "Gitbook: Build beautiful interactive books using GitHub/Git and Markdown",
		author = person("Samy Pessé and Aaron O'Mullan"),
		year = 2014,
		url = "http://www.gitbook.io/")
	write.bibtex(c(knitr = citation("knitr")[1], 
				   knitcitations = citation("knitcitations"),
				   devtools = citation("devtools"),
				   gitbook = gitbook.ref),
				 file='references.bib')
			
	message(
		'You can now open README.md and SUMMARY.md. Once you are done 
editting SUMMARY.md, initGitbook() will create the file and folder 
structure for your new Gitbook.')
	message(paste0('Current working directory: ', getwd()))
	invisible()
}
