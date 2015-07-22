cd _site
git add .
git commit -m "$1"
git push origin master
cd ..
git add .
git commit -m "$1"
git push origin source
