#' Returns the version information about the currently installed gitbook and
#' what is avaialble from \url{https://www.npmjs.org/}.
#' 
#' @return a character vector with two elements, \code{installed.version} and
#'         \code{available.version}.
#' 
#' @export
gitbookInfo <- function() {
	checkForGitbook(quiet=TRUE)
	installed <- system('gitbook --version', intern=TRUE)
	current <- system('npm view gitbook version', intern=TRUE)
	if(length(current) > 0) {
		current <- current[1]
		if(current == installed) {
			message(paste0('gitbook is up-to-date with version ', current))
		} else {
			message(paste0('A new version of gitbook is available. Version ',
						   installed, ' installed, ', current, ' available.'))
		}
	} else {
		warning(paste0('Could not get the current available version of gitbook.',
					   'Are you connected to the interent?'))
	}
	invisible(c(installed.version=installed, 
				available.version=current))
}
