#' This will build a gitbook from the source markdown files.
#' 
#' This function is simply a wrapper to a system call to \code{gitbook}.
#' 
#' \url{https://github.com/GitbookIO/gitbook}
#' 
#' @param source.dir location containing the source files.
#' @param out.dir location of the built book.
#' @param format the format of book. Options are pdf or ebook. If omitted, 
#'        this will build a website.
#' @param title Name of the book to generate, defaults to repo name
#' @param intro Description of the book to generate
#' @param github ID of github repo like : username/repo
#' @param theme the book theme to use. This defaults to using a MathJax
#'        enabled version of the default theme. Set to \code{NULL} to use the
#'        default theme from gitbook package.
#' @param buildRmd should \code{\link{buildRmd}} be called first.
#' @param ... other parameters passed to \code{\link{buildRmd}}.
#' @export
buildGitbook <- function(source.dir=getwd(),
						 out.dir=paste0(getwd(), '/_book'),
						 theme=paste0(find.package('Rgitbook'), '/themes/mathjax'),
						 buildRmd = TRUE,
						 format, title, intro, github, ...) {
	if(buildRmd) {
		message('Building R markdown files...')
		buildRmd(source.dir, ...)
		message('R Markdown files successfully built!')
	}
	
	checkForGitbook(quiet=TRUE)
	
	buildCmd <- 'build'
	if(!missing(format)) { buildCmd <- format }
	cmd <- paste0("gitbook ", buildCmd, " ", source.dir, " --output=", out.dir)
	if(!missing(title)) { cmd <- paste0(cmd, " --theme=", theme) }
	if(!missing(title)) { cmd <- paste0(cmd, ' --title="', title, '"') }
	if(!missing(intro)) { cmd <- paste0(cmd, ' --intro="', intro, '"') }
	if(!missing(github)) { cmd <- paste0(cmd, ' --github=', github) }
	if(!is.null(theme) & !is.na(theme)) { cmd <- paste0(cmd, " --theme=", theme) }
	system(cmd)
	
	# Post-process hack to fix broken img urls.
	# https://github.com/GitbookIO/gitbook/issues/99
	# Will also fix links to the Introduction
	# https://github.com/GitbookIO/gitbook/issues/113
	#dirs <- list.dirs(out.dir, recursive=FALSE, full.names=FALSE)
	#for(i in seq_along(dirs)) {
		files <- list.files(out.dir, '*.html', recursive=TRUE)
		for(j in seq_along(files)) {
			fconn <- file(paste0(out.dir, '/', files[j]))
			file <- readLines(fconn)
			close(fconn)
			#file <- gsub(paste0(dirs[i], '/', dirs[i], '/'), '', file)
			file <- gsub('./">', './index.html">', file)
			fconn <- file(paste0(out.dir, '/', files[j]))
			writeLines(file, fconn)
			close(fconn)
		}
	#}
}
