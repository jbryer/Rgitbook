


# Installation

The `gitbook` R package is currently avaiable on [Github](http://github.com). The `devtools` (<a href="http://CRAN.R-project.org/package=devtools">Wickham & Chang, 2013b</a>) package provides a function to install R packages directly from github.


```r
> devtools::install_github("jbryer/Rgitbook")
```


The [Gitbook.io](http://gitbook.io) framework is built using [Node.js](http://nodejs.org/). Installers are available for most major platforms and can be downloaded from the Node.js website at [http://nodejs.org/download/](http://nodejs.org/download/).

Once Node.js is installed the `installGitbook` function will attempt to download and install the Gitbook.io framework.


```r
> installGitbook()
```


We can verify that Gitbook is installed using the `checkForGitbook` function.


```r
> checkForGitbook()
```

```
gitbook is installed and available
```


### If Gitbook Installation Fails

It is possible that the installation of Gitbook will not work since it requires root/administrator access. The `installGitbook` function will print an error message to help you install outside of R. On Mac and Linux systems, the following Unix command will install Gitbook:

```
sudo npm install gitbook -g
```

If you wish to build PDF versions of your book, install the PDF format using the following command:

```
sudo npm install gitbook-pdf -g
```


