#' Builds markdown files from all Rmarkdown files in the given directories.
#' 
#' This function will build Rmarkdown files in the given directory to markdown.
#' The default is to traverse all subdirectories of the working directory
#' looking for .Rmd files to process. This function will save a file in the
#' working directory called \code{.rmdbuild} that contain the status of the
#' last successful build. This allows the function to only process changed files. 
#' 
#' @param dir root directory of the gitbook project.
#' @param clean if TRUE, all Rmd files will be built regardless of their 
#'        modification date. 
#' @param log.dir if specified, the output from \code{\link{knitr}} will be saved
#'        to a log file in the given directory.
#' @param log.ext if log files are saved, the file extension to use.
#' @param ... other parameters passed to \code{\link{knit}}.
#' @export
buildRmd <- function(dir = getwd(), clean=FALSE, log.dir, log.ext='.txt', ...) {
	dir <- normalizePath(dir)

	if(!exists('statusfile')) {
		statusfile <- '.rmdbuild'
		statusfile <- paste0(dir, '/', statusfile)
	}
	
	rmds <- list.files(dir[1], '.rmd$', ignore.case=TRUE, recursive=TRUE, full.names=TRUE)
	finfo <- file.info(rmds)
	
	if(!clean & file.exists(statusfile)) {
		load(statusfile)
		newfiles <- row.names(finfo)[!row.names(finfo) %in% row.names(rmdinfo)]
		existing <- row.names(finfo)[row.names(finfo) %in% row.names(rmdinfo)]
		existing <- existing[finfo[existing,]$mtime > rmdinfo[existing,]$mtime]
		rmds <- c(newfiles, existing)
	}
	
	knitenv <- new.env()
	bibs <- list.files(dir[1], '.bib$', ignore.case=TRUE)
	if(length(bibs) > 0) {
		if(length(bibs) > 1) {
			warning(paste0('More than one BibTex file found. Using ', bibs[1]))
		}
		with(knitenv, {
			bib <- read.bibtex(paste0(dir, '/', bibs[1]))
		})
	}
	
	for(j in rmds) {
		if(!missing(log.dir)) {
			dir.create(log.dir, showWarnings=FALSE, recursive=TRUE)
			log.dir <- normalizePath(log.dir)
			logfile <- paste0(log.dir, '/', sub('.Rmd$', log.ext, j, ignore.case=TRUE))
			dir.create(dirname(logfile), recursive=TRUE, showWarnings=FALSE)
			sink(logfile)
		}
		oldwd <- setwd(dirname(j))
		tryCatch({
			knit(basename(j), sub('.Rmd$', '.md', basename(j), ignore.case=TRUE), 
				 envir=knitenv, ...)
		}, finally={ setwd(oldwd) })
		if(!missing(log.dir)) { sink() }
	}
	
	rmdinfo <- finfo
	last.run <- Sys.time()
	last.R.version <- R.version
	save(rmdinfo, last.run, last.R.version, file=statusfile)
	invisible(TRUE)
}
