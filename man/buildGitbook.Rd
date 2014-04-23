\name{buildGitbook}
\alias{buildGitbook}
\title{This will build a gitbook from the source markdown files.}
\usage{
  buildGitbook(source.dir = getwd(),
    out.dir = paste0(getwd(), "/_book"), mathjax = TRUE,
    buildRmd = TRUE, format, title, intro, github, ...)
}
\arguments{
  \item{source.dir}{location containing the source files.}

  \item{out.dir}{location of the built book.}

  \item{format}{the format of book. Options are pdf or
  ebook. If omitted, this will build a website.}

  \item{title}{Name of the book to generate, defaults to
  repo name}

  \item{intro}{Description of the book to generate}

  \item{github}{ID of github repo like : username/repo}

  \item{mathjax}{if TRUE (default) include support for
  MathJax.}

  \item{buildRmd}{should \code{\link{buildRmd}} be called
  first.}

  \item{...}{other parameters passed to
  \code{\link{buildRmd}}.}
}
\description{
  This function is simply a wrapper to a system call to
  \code{gitbook}.
}
\details{
  \url{https://github.com/GitbookIO/gitbook}
}

