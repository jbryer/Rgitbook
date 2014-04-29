require(devtools)
getwd()

document()
check_doc()
install()
check()
build()

require(Rgitbook)
ls('package:Rgitbook') # List the public functions
gitbookInfo()
installGitbook()
demo('gitbook') # This will create a test project

# Build the Gitbook website
buildGitbook('website')
openGitbook()
publishGitbook('jbryer/Rgitbook')

# Other formats
buildGitbook('website', format='pdf')
buildGitbook('website', format='ebook')

# Send the package to CRAN
release()
