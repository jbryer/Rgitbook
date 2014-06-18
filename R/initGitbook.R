#' Create files and folders based on contents of SUMMARY.md.
#' 
#' This first calls system command \code{gitbook init} but then will change
#' the all the file extensions from \code{.md} to \code{.Rmd} excluding
#' \code{SUMMARY.md} and \code{README.md}.
#' 
#' @param dir source directory for the Gitbook.
#' 
#' @export
initGitbook <- function(dir=getwd()) {
  dir = getwd()
  dir <- normalizePath(dir)
  checkForGitbook(quiet = TRUE)
  oldwd <- setwd(dir)
  test <- system(paste0("gitbook init ", dir))
  if (test != 0) {
    stop("gitbook initalization failed")
  }
  mdfiles <- list.files(dir, "*.md", recursive = TRUE, full.names = TRUE)
  mdfiles <- mdfiles[-c(grep("README.md$", mdfiles), grep("SUMMARY.md$", mdfiles))]
  mdfiles2 <- gsub("\\.md$", ".Rmd", mdfiles)
  file.rename(mdfiles, mdfiles2)
  knitr.header <- c("```{r knitsetup, echo=FALSE, results='hide', warning=FALSE, message=FALSE, cache=FALSE}", 
                  "opts_knit$set(base.dir='./', fig.path='', out.format='md')", 
                  "opts_chunk$set(prompt=TRUE, comment='', results='markup')", 
                  "# See yihui.name/knitr/options for more Knitr options.", 
                  "##### Put other setup R code here", "", "",
                  "# end setup chunk",
                  "```")

  for (rmd in mdfiles2) {
    print(rmd)
    file <- file(rmd)
    lines <- readLines(file)
    close(file)
  # don't inject knitr setup chunk if Rmd file 
  # already has one, ie. editing an existing Rmd
  # or the references Rmd, which has a different setup
    toMatch <- c("r knitsetup", "r setup")
    matches <- grepl(paste(toMatch,collapse="|"), lines)  
    suppressWarnings(if (!any(matches)) {
      lines <- c(knitr.header, lines)
    })
    file <- file(rmd)
    writeLines(lines, file(rmd))
   close(file)
  }
  setwd(oldwd)
  invisible()
}
