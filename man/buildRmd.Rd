\name{buildRmd}
\alias{buildRmd}
\title{Builds markdown files from all Rmarkdown files in the given directories.}
\usage{
  buildRmd(dir = getwd(), clean = FALSE, log.dir,
    log.ext = ".txt", ...)
}
\arguments{
  \item{dir}{root directory of the gitbook project.}

  \item{clean}{if TRUE, all Rmd files will be built
  regardless of their modification date.}

  \item{log.dir}{if specified, the output from
  \code{\link{knitr}} will be saved to a log file in the
  given directory.}

  \item{log.ext}{if log files are saved, the file extension
  to use.}

  \item{...}{other parameters passed to
  \code{\link{knit}}.}
}
\description{
  This function will build Rmarkdown files in the given
  directory to markdown. The default is to traverse all
  subdirectories of the working directory looking for .Rmd
  files to process. This function will save a file in the
  working directory called \code{.rmdbuild} that contain
  the status of the last successful build. This allows the
  function to only process changed files.
}

