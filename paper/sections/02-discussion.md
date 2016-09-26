![Git logo] (../images/git-logo.png)

Git is a distributed version control system that allows you to track changes made to files and folders inside a repository. With Git, you can easily go back to previous versions of your work, and you can also easily collaborate with other people, even if multiple people are modifying the same file. Users have a local repository on their own machines, as well as a remote repository on a hosting service such as Github, so that the repository is also accessible on the web and others can also view and collaborate on it. 

In using Git, it's good practice to commit your changes frequently whenever something changes in your repository, and also add a descriptive message to the commit briefly describing what had been changed. In this way, it is easier for the user to view the changes made to their own repository, and it is also easier for collaborators to see what changes others have made. 

To initialize a local repository on your own machine in the current folder, use `git init`. Then you can link this local repository to a remote one using `git remote add origin url`, where url is the Github-supplied url of your remote repository. 

Use `git add filename` to add a specific file in the repository to the staging area. Then use `git commit -m "commit message"` to save the changes in the staging area and add a commit message. Finally use `git push origin`, along with the name of your current branch to push your local changes to the remote repository. 

To view the current status of your repository, you can use `git status` to view modified untracked files and changes not staged for commit. You can also view a log of all the repository's previous commits by using `git log`. 

To rollback your repository to a previous commit, you can use the `git checkout commitid` command to return your whole repository to the state it was in from the previous commit with the unique commitid. 

In addition, you can create branches with Git to make experimental changes to the repository without affecting the main branch, and if the changes are satisfactory, you can merge them into the main branch. Use the command `git checkout -b branchname` to create a new branch locally with a name you have selected, and then use `git push origin branchname` to push the branch to your remote repository. Collaborators can use this branch feature to test out new changes, and then make pull requests to the main branch on Github so others can review the changes before deciding to merge or reject the proposed changes. 






