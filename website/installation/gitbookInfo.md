


# Checking the Installed Version of Gitbook

Gitbook.io is under active development. The `gitbookInfo` function will indicate whether a new version of Gitbook is available.


```r
> gitbookInfo()
```

```
gitbook is up-to-date with version 0.4.6
```


If a new version is available, the `installGitbook` function will install the latest version.


```r
> installGitbook()
```


Additionally, the `checkForGitbook` function will also indicate whether Gitbook is installed and available but will not check the [Node Package Modules](https://www.npmjs.org/) website for the currently available version.


```r
> checkForGitbook()
```

```
gitbook is installed and available
```


The `quiet` parameter will not print any messages. The function returns a logical indicating whether Gitbook is available or not. This may be useful if you are automating your Gitbook development.


```r
> isAvailable <- checkForGitbook(quiet = TRUE)
> isAvailable
```

```
[1] TRUE
```


