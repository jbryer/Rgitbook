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
demo('gitbook') # This will create a test project

# Build the website
buildRmd('website'); buildGitbook('website')
openGitbook()
publishGitbook('jbryer/Rgitbook')

# Send the package to CRAN
release()
