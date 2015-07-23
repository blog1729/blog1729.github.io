---
title: Hakyll
date: 2015-07-18
---

Finally I've set up [Hakyll](http://jaspervdj.be/hakyll/)!
The current setup uses Hakyll to generate static site and Github pages to host it.
It took  me a fair amount of time to make things run smoothly.
If you want to create a blog using Hakyll and Github pages, here is one way you could get things running.

1. **Download Hakyll**

	If you have `cabal-install` installed, you may download it using `cabal install hakyll`, if not, you can download it using your package manager.

2. Now that you have Hakyll, generate the necessary files on your computer by running `hakyll-init name-of-your-blog`.

3. **Create repository at Github**

	The name of the repository should be `your-userid.github.io` in order to use Github pages.

4. Initialize the git repository: `git init`.

5. Create `.gitignore`.

	[Here](https://github.com/blog1729/blog1729.github.io/blob/source/.gitignore) is what my `.gitignore` looks like.

6. `git remote add origin https://github.com/username/username.github.io.git`

7. Compile `site.hs` by `ghc --make site.hs`.

8. `git commit --allow-empty -m "dummy"`.

9. `git checkout --orphan source`.

10. `git submodule add https://github.com/username/username.github.io _site`

11. In order to generate files, you can use `./site build` but if you have made deletions, then the changes do not propagate to _site folder. So you will have to use `./site rebuild` which basically removes the _site folder and then starts a fresh build. The problem here is that rebuild will remove all contents of _site folder including the .git file, which messes up things. To combat this problem, I wrote a tiny script `clean.sh` which you can get [here](https://github.com/blog1729/blog1729.github.io/blob/source/clean.sh). I recommend you download it, keep it in the same directory where `site` executable is placed and use the script instead of `./site rebuild` (you have to run `sh clean.sh`.)

	If, by mistake, the `.git` file inside `_site` got removed, you may create a file with the same name having content `gitdir: ../.git/modules/_site`.

12. `cd _site`, `git add --all`, `git commit -m 'changes'`.

13. Push the changes (of `_site` folder) to github by `git push origin master`.
	Similarly, push the changes of the root folder (the source branch) to github by `git push origin source`.

**Bonus**: In the current setup, once you make the necessary changes, you will have to first commit in `_site`, push to master, commit and push source.
Basically you are repeating yourself.
If you want to avoid this, you may you the shell script [bot](https://github.com/blog1729/blog1729.github.io/blog/source/bot).
Once you have in in the source directory, then run the command `./bot "Your commit message"`.

That's it. Now your blog will be live at the address `username.github.io`!

## Listings

`bot` script:

```bash
cd _site
git add .
git commit -m "$1"
git push origin master
cd ..
git add .
git commit -m "$1"
git push origin source
```

`clean.sh` script:

```bash
cp _site/.git /tmp
./site rebuild
cp /tmp/.git _site/
```
