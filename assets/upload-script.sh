cd ..

# if you are deploying to a custom domain
echo 'christian.ottenhaus.com' > CNAME

# deploy to github pages
git init
git add -A

# change user config
git config user.name "talionderhobbit"
git config user.email "44683039+talionderhobbit@users.noreply.github.com"

# deploy
git commit -m 'deploy'
git branch -M gh-pages
git remote add origin https://github.com/talionderhobbit/ch.git
git push -u -f origin gh-pages