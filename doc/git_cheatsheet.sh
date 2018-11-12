GIT cheat sheet

# get a help page for a command
$ git help config

# list configuration properties. Configuration is read from few files, so duplicates are possible. The last occurrence is taken into account
$ git config –list

# read one configuration property
$ git config user.name

# set one configuration property (local/working directory)
$ git config user.name "Mark Twain"
$ git config user.email mark@entito.pl

# set one configuration property (global/system)
$ git config --global user.name "Mark Twain"
$ git config --global user.email mark@entito.pl
$ git config --global core.editor emacs

# initialize a new project
$ git init

# update a staging area by adding modifying and removing files to match a working directory
$ git add --all
$ git add -A

# update a staging area by modifying, and removing files to match a working directory. New files add not added
$ git add -u

# interactive add
$ git add -i

# commit staged changes with a message inserted by editor
$ git commit

# commit staged changes with a specified message
$ git commit -m 'some message'

# commit all modified files (tracked) from a working directory, skipping a staging area
$ git commit -a -m 'some message'
or
$ git commit -am 'added new benchmarks'

# show differences between a working directory and a staging area
$ git diff

# show differences between staging area and HEAD
$ git diff --cached
or 
$ git diff --staged

# check a working directory for white spaces
$ git diff --check
file.txt:3: trailing whitespace.
+}

# check a staging area for white spaces
$ git diff --cached --check
file.txt:3: trailing whitespace.
+}

# clone a repository into a local directory (last URLs part is a name of the cloned project)
$ git clone https://github.com/libgit2/libgit2

# clone a repository into a local directory with a custom name
$ git clone https://github.com/libgit2/libgit2 mylibgit

# display staged files, files with differences between a working directory and a staging area and not tracked files
$ git status

# short status (left side values give a staging area status, right side values give a working directory status)
$ git status -s
MM someFile.txt

# short status with a current branch info
$ git status -sb (b- show branch)
## master
?? someFile.txt

# unstage all files and reset their state to the HEAD
$ git reset
or
$ git reset HEAD

# unstage a specified file
$ git reset HEAD someFile.txt

# revert changes to a staged file
$ git checkout -- someFile
$ git checkout HEAD^ -- someFile
$ git checkout origin/master – someFile

# create a new branch based on a remote branch and checkout to it
$ git checkout -b serverfix origin/serverfix
Branch serverfix set up to track remote branch serverfix from origin.
Switched to a new branch 'serverfix'

#set a branch to track a remote branch
$ git checkout --track origin/serverfix
or
#set a branch to track a remote branch if the branch name you’re trying to checkout (a) doesn’t exist and (b) exactly matches a name on only one remote, Git will create a tracking branch for you)
$ git checkout serverfix
Branch serverfix set up to track remote branch serverfix from origin.
Switched to a new branch 'serverfix'

# set up a local branch with a different name than the remote branch
$ git checkout -b [branchName] [origin/otherBranchName]
$ git checkout -b sf origin/serverfix

# remove a file from a repository
$ git rm someFile.txt
$ git commit -m "file removed"

# remove a file from a staging area
$ git rm --cached someFile.txt

# rename a file in a working directory (same as git rm + git add)
$ git mv Wheel.java FastWheel.java

# show commit history
$ git log

#show last n commits
$ git log -3

# show commit history,  one commit per line
$ git log --oneline
9336940 (HEAD -> master) Merge branch 'testing'
50f829e (testing) sth
12cdcd3 add file in testing branch

# show commit history with changes
$ git log -p

# show commit history, one line per commit with statistics
$ git log --pretty=oneline --stat

#show log history with formatted output; h-short hash; au-autor name; ad- author date relative; s-subject
$ git log --pretty=format:"%h - %an, %ar : %s"
286d3d6 - Marek, 14 minutes ago : fast wheel

# show log history with a short hash
$ git log -1 --pretty=oneline --abbrev-commit
286d3d6 (HEAD -> master) fast wheel

#show log history with an ASCII graph showing branch and merge history
$ git log --oneline --graph

#show log history with boundaries
$ git log --since=2.minutes
$ git log --since=2.days

# show log history that is referred by some branch or tag
$ git log --graph --oneline –simplify-by-decoration

# show log history between commits or tags
$ git log 73bcb3c..e8ea169 --oneline
# list all commits from a master which are not on a remote server
git log origin/master..HEAD

# filter code change history by string (-S)
$ git log -SsomeText

# filter log history by commit messages
$ git log --grep someText

# modify last commit (a message or staged files)
$ git commit –amend

# list remote servers
$ git remote
origin

# list remote servers with URL
$ git remote -v
origin https://github.com/schacon/ticgit (fetch)
origin https://github.com/schacon/ticgit (push)

# show remote server details
$ git remote show origin

# add a remote server
$ git remote add remoteName https://github.com/paulboone/ticgit

# rename a remove server
$ git remote rename [remoteNameOld] [remoteNameNew]

# remove a remove server
$ git remote rm remoteName

# fetch data from a remote server (by default the origin remote)
$ git fetch
or
$ git fetch origin

# fetch data from all remote servers (if more remotes specified)
git fetch –all

# remove any remote-tracking references that no longer exist on the remote and fetch
$ git fetch –p
or
$ git fetch --prune

# fetch and reset a working directory
$ git fetch
$ git reset --hard origin/master

# revert changes to a specific branch
$ git reset --hard origin/[branch]

# pull fetches changes from a server and merges them into a working directory. Generally it’s better to simply use the fetch and merge commands explicitly as the magic of git pull can often be confusing
$ git pull

# push data to a remote server
$ git push
or
$ git push [remote-name] [branch-name]
$ git push origin master

# push tags to the server (by default, the git push command doesn’t transfer tags to remote servers)
$ git push origin [tag-name]
$ git push origin v1.5

# push all tags to the server
$ git push origin –tags

# push and set the upstream
$ git push --set-upstream origin master
or
$ git push -u origin master

# list tags in an alphabetical order
$ git tag

# list tags using regexp
$ git tag -l "v1.8.5*"

# create annotated tag (preferred)
$ git tag -a v1.4 -m "my version 1.4"

# create annotated tag for a specific commit
$ git tag -a v1.2 9fceb02

# create a lightweight tag (a pointer like a branch which points to one commit, doesn't move)
$ git tag v1.4 -m "my version 1.4"

# show tag details
$ git show v1.4s

# change to a local branch
$ git checkout [someName]

# create a new local branch based on a branch and change working directory to it
 (branch someName + git checkout someName)
$ git checkout -b [branchname]
$ git checkout -b someIssue
Switched to a new branch 'someIssue'

# create a new local branch based on a tag and change working directory to it
$ git checkout -b [branchname] [tagname]
$ git checkout -b version2 v2.0.0
Switched to a new branch 'version2'

# create a new alias for a command
$ git config --global alias.unstage 'reset HEAD --'
$ git unstage someFile (instead of $ git reset HEAD -- someFile)

# create a new alias for a command
$ git config --global alias.last 'log -1 HEAD'
$ git last

# list branches (-v verbose with a short hash and a commit message)
$ git branch -v
* master      9336940 Merge branch 'testing'
  someIssue 843e411 hmm
  testing     50f829e sth

# create a new local branch
$ git branch [someName]

# list branches which are already merged (it's save to delete listed branches except current one with *)
$ git branch --merged
	iss53
    • master

# delete a remote branch
$ git push origin --delete serverfix
To https://github.com/schacon/simplegit
[deleted] serverfix

# list branches which are not yet merged
$ git branch no-merged

# print the name of the upstream branch and commits (behind, ahead)
$ git branch -vv
iss53 7e424c3 [origin/iss53: ahead 2] forgot the brackets
master 1ae2a45 [origin/master] someCommitMessage
* serverfix f8674d9 [teamone/server-fix-good: ahead 3, behind 1] someCommitMessage

# remove a branch (safe after merge)
$ git branch -d someIssue

#  if you already have a local branch and want to set it to a remote branch you
just pulled down, or want to change the upstream branch you’re tracking, you
can use the -u or --set-upstream-to option to git branch to explicitly set
it at any time
$ git branch -u origin/serverfix
Branch serverfix set up to track remote branch serverfix from origin.

# merge a current branch with another one
$ git merge [anotherBranch]

# revert changes after unsuccessful merge to the state before merge (use after merge conflict)
$ git merge --abort 

# resolve conflicts after merge (mergetool must be configured)
$ git mergetool

# when you have a tracking branch set up, you can reference its upstream
branch with the @{upstream} or @{u} shorthand. So if you’re on the master
branch and it’s tracking origin/master, you can say something like git
merge @{u} instead of git merge origin/master if you wish
$ git merge @{u}

# show reference log history, reflog information is strictly local
$ git reflog
84d7dc9 (HEAD -> master) HEAD@{0}: merge testing: Merge made by the 'recursive' strategy.
843e411 HEAD@{1}: checkout: moving from testing to master

# show various types of objects 
$ git show [hash]
$ git show 1c002d

# show three commits before HEAD
$ git show HEAD^^^
or
$ git show HEAD~3

# show where a project was some time ago
$ git show master@{yesterday}
$ git show HEAD@{2.months.ago} // from reflog
$ git show HEAD@{0}

# show a commit's parent of the HEAD
$ git show HEAD^

# show a parent of a specified commit
$ git show d921970^
$ git show d921970^2 // show second parent, only make sense for merge commits

# save your local modifications to a new stash entry and roll them back to HEAD
$ git stash

# save a stash with a message
$ git stash push -m "named stash" --include-untracked
Saved working directory and index state On trash: named stash

# list stashed changes
$ git stash list

# remove last stashed state
$git stash drop stash@{0}

# save your local modifications to a new branch  and roll back to HEAD
$ git stash branch [branchName]

# apply stashed changes to a  working directory and a staging area
$ git stash apply

# remove a single stashed state from the stash list and apply it on top of the current working tree state (git stash apply + git stash drop)
$ git stash pop

#  if the --keep-index option is used, all changes already added to the index are left intact.
$ git stash --keep-index

# if the --include-untracked option is used, all untracked files are also stashed and then cleaned up with git clean
$ git stash --include-untracked

# if the --all option is used instead then the ignored files are stashed and cleaned in addition to the untracked files
$ git stash --all

# clear all stash entries
$ git stash clear

# remove untracked files that are not ignored
$ git clean

# remove files and subdirectories that become empty as a result, -d dry run
$ git clean -d -n

# -x remove also ignored files
$ git clean -n -d -x

# revert creates new commit which revert changes from the specified one
$ git revert [commit]

# revert a range of commits
$ git revert [firstBadCommit]..[lastBadCommit] 

#  integrate changes in a given commit into a current branch.
$ git cherry-pick [commit]
