\name{publishGitbook}
\alias{publishGitbook}
\title{Publish the built gitbook to Github.}
\usage{
publishGitbook(repo, out.dir = paste0(getwd(), "/_book"),
  message = "Update built gitbook", CNAME = "")
}
\arguments{
  \item{repo}{the github repository. Should be of form
  username/repository}

  \item{out.dir}{location of the built gitbook.}

  \item{message}{commit message.}

  \item{CNAME}{web address to be added to CNAME file on
  github for custom domain names}
}
\description{
Note that this is a wrapper to system \code{git} call.
}
\details{
This function assumes that the repository has already
exists on Github.

Thanks to ramnathv for the shell script.
https://github.com/GitbookIO/gitbook/issues/106#issuecomment-40747887
}

