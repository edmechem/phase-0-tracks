# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

Version control is a system that allows you to roll back to a previous version of your code if you make a mistake, and that lets a project have multiple people working on various parts of it at the same time, and have their work clearly delineated & individually reviewable.

* What is a branch and why would you use one?

Always work on a branch! Not on the master. Making a new branch means, making a copy of the whole project, which then allows you to do work & make changes, and then when you're done, commit them back into the main Master branch.

* What is a commit? What makes a good commit message?

Committing is when you send your changes from your branch, to be folded back into the Master branch. A good commit message explains what the changes or new features are.

* What is a merge conflict?

A merge conflict is when, two people let's say, have each branched the project, and are working on *the same section of code at the same time*, let's say. Person A commits their code, ok fine. But then when Person B commits their code, there could easily be a conflict because, the master is now different (after Person A commits) than it was when Person B checked out the code - thus, Git doesn't know which version should be the actual one, going forward.
