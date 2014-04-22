#' This will install Gitbook.io.
#' 
#' This function will install Gitbook from \url{http://nodejs.org/download/}
#' regardless if the current version. That is, this function will either update
#' or install a new version of Gitbook.io.
#' 
#' On many systems this function will not work as installing requires root
#' access. The function will print the required commands for you to copy-and-paste
#' to the terminal.
#' 
#' @export
installGitbook <- function() {
	cmds <- c('npm install gitbook -g',
			  'npm install gitbook-pdf -g')
	for(i in cmds) {
		if(Sys.info()['sysname'] == 'Windows') {
			cmd <- i
		} else {
			cmd <- paste0('sudo -A ', i)
			#test <- system(cmd, input=readline("Enter your password: "))
		}
		test <- system(cmd)
		if(test != 0) { stop(paste0("gitbook installation failed. Typically ", 
									"installing as root/Administrator ",
									"from the terminal/console works:\n",
									paste0('   ', cmds , collapse='\n'))) }		
	}
	invisible()
}
