#' Publish the built gitbook to Github.
#' 
#' Note that this is a wrapper to system \code{git} call.
#' 
#' This function assumes that the repository has already exists on Github.
#' 
#' Thanks to ramnathv for the shell script.
#' https://github.com/GitbookIO/gitbook/issues/106#issuecomment-40747887
#' 
#' @param repo the github repository. Should be of form username/repository
#' @param out.dir location of the built gitbook. 
#' @param message commit message.
#' @param CNAME web address to be added to CNAME file on github for custom domain names
#' 
#' @export
publishGitbook <- function(repo, 
						   out.dir=paste0(getwd(), '/_book'),
						   message='Update built gitbook',
               CNAME = ""
               ) {
	test <- system('git --version', ignore.stderr=TRUE, ignore.stdout=TRUE, show.output.on.console=FALSE)
	if(test != 0) { stop('Git does not appear to be installed.')}
	
  
  if(CNAME != ""){
	  fileConn<-file("CNAME")
	  writeLines(CNAME, fileConn)
	  close(fileConn)
	}
  
  cmd <- paste0(
		"cd ", out.dir, " \n",
		"git init \n",
		"git commit --allow-empty -m '", message,"' \n",
		"git checkout -b gh-pages \n",
		"git add . \n",
		"git commit -am '", message, "' \n",
		"git push git@github.com:", repo, " gh-pages --force ")
	system(cmd)
}
