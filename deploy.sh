hugo

git checkout --orphan gh-pages
git rm -rf .
git add ./public
git commit -m "Update"