#' Open a built gitbook.
#' 
#' This function is a wrapper to the system call of \code{open} which should 
#' open the book in the system's default web browser.
#' 
#' @param out.dir location of the built gitbook.
#' 
#' @export
openGitbook <- function(out.dir=paste0(getwd(), '/_book')) {
	browseURL(paste0(out.dir, '/index.html'))
}
