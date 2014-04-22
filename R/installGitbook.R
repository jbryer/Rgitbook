#' This will install Gitbook.io.
#' 
#' This function will install Gitbook from \url{http://nodejs.org/download/}
#' regardless if the current version. That is, this function will either update
#' or install a new version of Gitbook.io.
#' 
#' @export
installGitbook <- function() {
	test <- system('sudo -A npm install gitbook -g')
	if(test != 0) { stop(paste0("gitbook installation failed. Typically ", 
								"installing as root/Administrator works:\n",
								"  sudo npm install gitbook -g")) }
	invisible()
}
