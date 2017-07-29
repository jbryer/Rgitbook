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
#' 
#' @export
publishGitbook <- function(repo, 
						   out.dir=paste0(getwd(), '/_book'),
						   msg='Update built gitbook') {
	test <- system('git --version', ignore.stderr=TRUE, ignore.stdout=TRUE, show.output.on.console=FALSE)
	if(test != 0) { stop('Git does not appear to be installed.')}
	cmd <- paste0(
		"cd ", out.dir, " \n",
		"git init \n",
		"git commit --allow-empty -m '", msg,"1' \n",
		"git checkout -b gh-pages \n",
		"git add . \n",
		"git commit -a -m '", msg, "2' \n",
		"git push https://github.com/", repo, " gh-pages --force ")
	system(cmd)
}
