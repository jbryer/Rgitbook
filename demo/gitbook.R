require(Rgitbook)

pause <- function () { 
	cat("Hit <enter> to continue...")
	readline()
	invisible()
}

oldwd <- getwd() # Save to reset the working directory later
checkForGitbook() # Verify gitbook in installed, will try to install if not
gitbookInfo() # What version is installed and available
dir <- tempdir() # Where we'll put the test project
newGitbook(paste0(dir, '/testbook'))
list.files(all.files=TRUE, recursive=TRUE)
pause()

initGitbook()
list.files(all.files=TRUE, recursive=TRUE) # initGitbook creates .Rmd files
pause()

buildRmd()
list.files(all.files=TRUE, recursive=TRUE) # Should now be .md files
pause()

buildGitbook()
openGitbook()
pause()

setwd(oldwd)
unlink(dir, recursive=TRUE, force=TRUE) # Delete the test project
