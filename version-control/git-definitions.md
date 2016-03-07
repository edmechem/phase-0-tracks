# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

Version control is a system that manages different versions of files. Git is one such system, that runs locally on your command line. It lets you branch the project, make changes, commit them, then merge that branch back into the master version of the project. Among other things, this system allows you to roll back to previous versions of the project if it's discovered you've introduced a bug, for example.

A file managed by Git can be in three states:

* (modified, and) not staged for commit - after you've just worked on it
* (modified, and) staged - ready for commit, after you've used "add" command
* clean - all files & directories managed by Git are "clean", in other words, all changes that have been made have been tracked by Git, and this branch is ready to be merged back into Master.

GitHub is a cloud-based system based on Git, which allows multiple people to work on local clones, of the same project. Ideally, each person's code is reviewed by someone else, before being merged back in to the master branch. Aside from allowing for easy collaboration like this, another benefit to using GitHub is that the entire project can be distributed across multiple machines, thus reducing risk of single point of failure.

* What is a branch and why would you use one?

Always work on a branch! Not on the master. Making a new branch means, you're effectively making a copy of the whole project, which then allows you to do work & make changes, and then when you're done, merge them back into the main Master branch. You do this so that if it's discovered later that you've made some mistake, that merge can be undone, reverting to how the project was before.

* What is a commit? What makes a good commit message?

Committing is when you're done working on your branch, and you want to prepare Git to be able to merge the branch back into Master. Checking git status frequently with ```git status``` is a good idea, to make sure you've added/staged all the modified files, before committing. A good commit message describes briefly what the changes or new features are.

* What is a merge conflict?

A merge conflict is when, two people let's say, have each branched the project, and are working on *the same section of code at the same time*, let's say. Person A commits their code, ok fine. But then when Person B commits their code, there could easily be a conflict because, the master is now different (after Person A commits) than it was when Person B checked out the code - thus, Git doesn't know which version should be the actual one (A's changes, or B's changes), going forward.
