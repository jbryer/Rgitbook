


# Building Gitbook

The `buildGitbook` function create a Gitbook from your source files.


```r
> buildGitbook()
```


The parameters for the `buildGitbook` function are:

* `source.dir` (default is `getwd()`) - The directory containing your Gitbook source files.
* `out.dir` (default is the `_book` directory in the current working directory) - The directory where your  Gitbook will be built.
* `theme` (default is the MathJax theme) - The path to the Gitbook theme that should be used. The `Rgitbook` includes a theme that adds support for MathJax.
* `buildRmd` (default is `TRUE`) - Should the R Markdown files be built first.
* `format` - The format of the generated Gitbook. Options include `pdf` and `ebook`.
* `title` - The title of your Gitbook.
* `intro` - The introduction of your Gitbook.
* `github` - Your Github root address.
* `...` - Other parameters passed to `buildRmd`.


