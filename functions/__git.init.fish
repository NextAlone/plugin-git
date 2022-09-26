function __git.init
    function __git.create_abbr -d "Create Git plugin abbreviation"
        set -l name $argv[1]
        set -l body $argv[2..-1]
        abbr -a $name $body
        set -a __git_plugin_abbreviations $name
    end

    set -q __git_plugin_initialized; and return 0

    set -U __git_plugin_abbreviations

    # git abbr
    __git.create_abbr g git

    # git add abbr
    __git.create_abbr ga git add
    __git.create_abbr gaa git add --all
    __git.create_abbr gau git add --update
    __git.create_abbr gap git add --patch

    # git apply abbr
    __git.create_abbr gapp git apply

    # git branch abbr
    __git.create_abbr gb git branch --verbose --verbose
    __git.create_abbr gba git branch --add --verbose --verbose
    __git.create_abbr gbr git branch --remove --verbose --verbose
    # __git.create_abbr gban git branch -a --verbose --no-merged
    __git.create_abbr gbd git branch --delete
    __git.create_abbr gbd! git branch -D

    # git blame abbr
    __git.create_abbr gbl git blame -b -w

    # git bisect abbr
    __git.create_abbr gbs git bisect
    __git.create_abbr gbsb git bisect bad
    __git.create_abbr gbsg git bisect good
    __git.create_abbr gbsr git bisect reset
    __git.create_abbr gbss git bisect start

    # git commit abbr
    __git.create_abbr gc git commit --verbose --signoff
    __git.create_abbr gc! git commit --verbose --amend --signoff
    __git.create_abbr gcn! git commit --verbose --no-edit --amend
    __git.create_abbr gca git commit --verbose --all --signoff
    __git.create_abbr gca! git commit --verbose --all --amend
    __git.create_abbr gcan! git commit --verbose --all --no-edit --amend
    __git.create_abbr gcm git commit --signoff --message
    __git.create_abbr gcam git commit --signoff --all --message
    __git.create_abbr gcfx git commit --fixup
    __git.create_abbr gcu git commit --signoff --message 'Update'

    # git config abbr
    __git.create_abbr gcf git config

    # git clone abbr
    __git.create_abbr gcl git clone

    # git clean abbr
    __git.create_abbr gclean git clean -d --interactive
    __git.create_abbr gclean! git clean -d --force -x
    __git.create_abbr gclean!! "git reset --hard; and git clean -dfx"

    # git checkout abbreviations
    __git.create_abbr gco git checkout

    # git commit count abbr
    __git.create_abbr gcount git shortlog --summary --numbered

    # git cherry-pick abbr
    __git.create_abbr gcp git cherry-pick
    __git.create_abbr gcpa git cherry-pick --abort
    __git.create_abbr gcpc git cherry-pick --continue

    # git diff abbr
    __git.create_abbr gd git diff --word-diff
    __git.create_abbr gdc git diff --word-diff --cached
    __git.create_abbr gds git diff --stat
    __git.create_abbr gdsc git diff --stat --cached
    __git.create_abbr gdto git difftool

    # git update ignore abbr
    __git.create_abbr gignore git update-index --assume-unchanged
    __git.create_abbr gunignore git update-index --no-assume-unchanged

    # git fetch abbr
    __git.create_abbr gf git fetch --verbose
    __git.create_abbr gfa git fetch --verbose --all --prune
    __git.create_abbr gfo git fetch --verbose origin

    # git pull abbr
    __git.create_abbr gl git pull --rebase --autostash
    __git.create_abbr gla git pull --all --verbose --rebase --autostash
    __git.create_abbr glo git pull origin --rebase --autostash

    # git log abbr
    __git.create_abbr glg git log --oneline --decorate --color --graph
    __git.create_abbr glgs git log --stat --graph
    __git.create_abbr glga git log --graph --decorate --all

    # git merge abr
    __git.create_abbr gmg git merge
    __git.create_abbr gmga git merge --abort
    __git.create_abbr gmgc git merge --continue
    __git.create_abbr gmgo git merge origin/\(__git.default_branch\)
    __git.create_abbr gmt git mergetool --no-prompt

    # git push abbr
    __git.create_abbr gp git push
    __git.create_abbr gpu git push --set-upstream origin 
    __git.create_abbr gp! git push --force-with-lease

    # git remote abbr
    __git.create_abbr gr git remote --verbose
    __git.create_abbr gra git remote add
    __git.create_abbr grmv git remote rename
    __git.create_abbr grrm git remote remove
    __git.create_abbr grset git remote set-url
    __git.create_abbr grup git remote update

    # git rebase abbr
    __git.create_abbr grb git rebase
    __git.create_abbr grba git rebase --abort
    __git.create_abbr grbc git rebase --continue
    __git.create_abbr grbs git rebase --skip
    __git.create_abbr grbi git rebase --interactive
    __git.create_abbr grbm git rebase \(__git.default_branch\)
    __git.create_abbr grbmi git rebase \(__git.default_branch\) --interactive
    __git.create_abbr grbd git rebase dev
    __git.create_abbr grbdi git rebase dev --interactive

    # git revert abbr
    __git.create_abbr grev git revert

    # git reset abbr
    __git.create_abbr grh git reset
    __git.create_abbr grhh git reset --hard
    __git.create_abbr grhpa git reset --patch

    # git rm abbr
    __git.create_abbr grm git rm
    __git.create_abbr grmc git rm --cached

    # git restore abbr
    __git.create_abbr grs git restore
    __git.create_abbr grsp git restore --patch
    __git.create_abbr grss git restore --source
    __git.create_abbr grst git restore --staged
    __git.create_abbr grstp git restore --staged --patch

    # git show abbr
    __git.create_abbr gsh git show --patch-with-stat

    # git status abbr
    __git.create_abbr gs git status -s

    # git stash abbr
    __git.create_abbr gst git stash
    __git.create_abbr gstd git stash drop
    __git.create_abbr gstl git stash list
    __git.create_abbr gstp git stash pop
    __git.create_abbr gsts git stash show --text
    __git.create_abbr gstc git stash clear

    # git submodule abbr
    __git.create_abbr gsm git submodule
    __git.create_abbr gsmu git submodule update
    __git.create_abbr gsmur git submodule update --recursive
    __git.create_abbr gsmuri git submodule update --recursive --init

    # git tag abbr
    __git.create_abbr gtg git tag
    __git.create_abbr gtgv git tag | sort -V

    # git switch abbr
    __git.create_abbr gsw git switch
    __git.create_abbr gswc git switch --create

    # git whatchanged abbr
    __git.create_abbr gwch git whatchanged -p --abbrev-commit --pretty=medium

    # git flow abbreviations
    __git.create_abbr gfb git flow bugfix
    __git.create_abbr gff git flow feature
    __git.create_abbr gfr git flow release
    __git.create_abbr gfh git flow hotfix
    __git.create_abbr gfs git flow support

    __git.create_abbr gfbs git flow bugfix start
    __git.create_abbr gffs git flow feature start
    __git.create_abbr gfrs git flow release start
    __git.create_abbr gfhs git flow hotfix start
    __git.create_abbr gfss git flow support start

    __git.create_abbr gfbt git flow bugfix track
    __git.create_abbr gfft git flow feature track
    __git.create_abbr gfrt git flow release track
    __git.create_abbr gfht git flow hotfix track
    __git.create_abbr gfst git flow support track

    __git.create_abbr gfp git flow publish

    # Cleanup declared functions
    functions -e __git.create_abbr

    # Mark git plugin as initialized
    set -U __git_plugin_initialized (date)
end
