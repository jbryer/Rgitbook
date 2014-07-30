#' Check if Gitbook is installed.
#' 
#' If Gitbook is not installed it will try to do so. If the installion fails or
#' Node.js is not installed, an error will be thrown.
#' 
#' @param quiet logical indicating whether messages should be printed.
#' @export
checkForGitbook <- function(quiet=FALSE) {
	if(system('npm version', ignore.stdout=TRUE) != 0) {
		stop("Cannot find node.js. You can install it from http://nodejs.org/download/")
	}
	if(system('gitbook', ignore.stdout=TRUE) != 0) {
		if(!quiet) { message("Installing gitbook...") }
		installGitbook()
	}
	if(!quiet) { message('gitbook is installed and available')}
	invisible(TRUE)
}
