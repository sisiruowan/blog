#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo --buildDrafts 

# commit changes
git add .

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
echo 'commit changes success.'
# push
git push
# push to gihub.io
git subtree push --prefix=public https://github.com/sisiruowan/sisiruowan.github.io.git master
echo 'push to remote success.'