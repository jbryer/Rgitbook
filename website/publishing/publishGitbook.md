


# Publishing a Gitbook to Github

The final step is to publish your Gitbook to Github. The `publishGitbook` is a wrapper to `git` that will publish your Gitbook to the `gh-pages` branch of the specified repository.


```r
> publishGitbook("jbryer/Rgitbook")
```


The parameters for the `publishGitbook` function are:

* `repo` - The Github repository to publish to. It should be of the username/repository format.
* `out.dir` (default is the `_book` subdirectory of the current working directory) - The directory containing the generated Gitbook.
* `message` (default is "Update built gitbook") - The commit message.
