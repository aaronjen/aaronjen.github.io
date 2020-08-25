hugo

cp -rf ./public ./temp
cp -rf ./.git ./temp
cd ./temp
git branch -D master
git checkout --orphan master
git rm -rf .
git add .
git commit -m "Update"
git push -f origin master
cd ..
rm -rf ./temp
