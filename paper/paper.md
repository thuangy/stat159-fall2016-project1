# Abstract

This report describes the purpose and usage of Makefiles, Git and Github, Pandoc, and Markdown. 

 
# Introduction

![Stat159 Logo](../images/stat159-logo.png)

The purpose of this stat159 project is to give brief descriptions of Makefiles, Git and Github, Pandoc, and Markdown, as well as how to use them. I hope to make it easier for others who may not be familiar with these tools to still be able to use them and improve their workflows. In addition, this project will also make it easier for me to look back on these tools as a reminder on how to use them. 

# Discussion

## Makefile

A Makefile is a textfile that tells GNU Make, a Unix tool, to execute rules, or a series of commands that build a target file from zero or more source files. The structure of a rule is 

``` 
target (target file): dependencies (optional source files)
	commands
```

To execute the commands in the Makefile, simply type `make` in the command line while in the directory containing the Makefile. This file makes it extremely easy to run multiple command line commands that may have to be repeated, without having to remember each command and retype them every time, in which you also run the risk of mistyping a command. It simplifies the process immensely for the user. 


There are also special targets, such as `all` and `clean`. The `all` target tells Make to run multiple rules to create multiple target files that the user specifies. It should be the first target, and so is the first to be executed. The format is as follows

```
all: rules (output target files)
```

The `clean` target typically doesn't have have any dependencies, and is used to remove specific output files that have been created through the Makefile. It's run in the console by typing `make clean`. 

To make sure that your Make does not confuse these special targets with actual filenames in your directory, add 

```
.PHONY: all clean
```

to the top of your Makefile, which tells Make explicitly that `all` and `clean` are not the names of files. 

In addition, you can declare variables at the top of your Makefile, to reduce repetition in typing out filenames. For instance, you can define a variable such as `out = paper/paper.html`. To use this variable within in your Makefile's rules, simply replace the filename with `$(out)`, or more generally the name of your variable surrounded by parentheses with a `$` in front. 

To use wildcards inside your variables, you will need to use the wildcard function to allow for wildcard character expansion. An example of its usage is `imgs = $(wildcard images/*.png)`. 

Finally, you can use automatic variables inside your rules. One such example is if you would like to refer to the name of your target file inside your commands for the rule for that target, so you can simply substitute the target file name with `$@`. 



## Git and Github


![Git Logo](../images/git-logo.png)

![Github Logo](../images/github-logo.png)

Git is a distributed version control system that allows you to track changes made to files and folders inside a repository. With Git, you can easily go back to previous versions of your work, and you can also easily collaborate with other people, even if multiple people are modifying the same file. Users have a local repository on their own machines, as well as a remote repository on a hosting service such as Github, so that the repository is also accessible on the web and others can also view and collaborate on it. 

In using Git, it's good practice to commit your changes frequently whenever something changes in your repository, and also add a descriptive message to the commit briefly describing what had been changed. In this way, it is easier for the user to view the changes made to their own repository, and it is also easier for collaborators to see what changes others have made. 

To initialize a local repository on your own machine in the current folder, use `git init`. Then you can link this local repository to a remote one using `git remote add origin url`, where url is the Github-supplied url of your remote repository. 

Use `git add filename` to add a specific file in the repository to the staging area. Then use `git commit -m "commit message"` to save the changes in the staging area and add a commit message. Finally use `git push origin`, along with the name of your current branch to push your local changes to the remote repository. 

To view the current status of your repository, you can use `git status` to view modified untracked files and changes not staged for commit. You can also view a log of all the repository's previous commits by using `git log`. 

To rollback your repository to a previous commit, you can use the `git checkout commitid` command to return your whole repository to the state it was in from the previous commit with the unique commitid. 

In addition, you can create branches with Git to make experimental changes to the repository without affecting the main branch, and if the changes are satisfactory, you can merge them into the main branch. Use the command `git checkout -b branchname` to create a new branch locally with a name you have selected, and then use `git push origin branchname` to push the branch to your remote repository. Collaborators can use this branch feature to test out new changes, and then make pull requests to the main branch on Github so others can review the changes before deciding to merge or reject the proposed changes. 


## Pandoc

![Pandoc Logo](../images/pandoc-logo.png)

Pandoc is a tool that converts files from one format to another. It allows the user to easily turn one file into many different output formats, saving a lot of time and energy. 

For example, you may wish to convert a Markdown file to an HTML file, so you would use the command

```
pandoc -f markdown -t html pandoc_example.mdown -o pandoc_example_output.html
```

If you wish to create a stand-alone HTML document from a Markdown file

```
pandoc pandoc_example.mdown -s -o pandoc_example_output.html
```

To convert a Markdown file to a Latex document, saved as a PDF

```
pandoc -f markdown -t latex pandoc_example.mdown -o pandoc_example_output.pdf
```

To convert a Markdown file to a Word document, saved as a docx file

```
pandoc -f markdown -t docx pandoc_example.mdown -o pandoc_example_output.docx
```

## Markdown

![Markdown Logo](../images/markdown-logo.png)

Markdown is a simple language that allows content to be easily displayed on the web. 

Formatting text is very simple in Markdown. To create a header, simply preface your text with one or more `#`, depending on how large you wish the text to be. 

```
# Header 1
## Header 2
### Header 3
```

To create bolded text, simply wrap the text in `**`. To create italicized text, wrap the text in `_`. 

```
This is **bold** text.
This is _italicized_ text.
This is _**bold and italicized**_ text. 
```

You can create unordered lists in Markdown with `*` as bullets, and ordered lists with numbers. In addition to create sublists, simply add a tab character before the `*` or the number.

```
### An unordered list

* Apples
	* Sublist Item 1
	* Sublist Item 2
* Oranges
* Bananas

### An ordered list

1. Eat
2. Sleep
3. Repeat
```

To add a link to your Markdown file, simply format it `[Text to Click](url)`. Similarly for images, the format is `![Image Caption](link or path to image)`. 

To add a code block to your file, as I have done above, simply wrap your code with three `` ``` ``. For inline code, just wrap it with one  `` ` ``. 


## Resources

I used all the above resources to create this project, as well as the command line interface the the Sublime text editor. Actually using the tools was "easy", as the Makefile made combining my sections into one paper very simple through automation, Git and Github helped me keep track of my work, Pandoc was used in my Makefile to easily convert my paper.md to my paper.html, and Markdown was used to write all the content sections of my project and also helped to easily display code sections. The challenging part was learning how to use each of these tools, but once you've gotten past the initial learning curve, it makes all of your future projects much easier. In particular, I was confused by the Makefile and its role in this project, but later I understood that its purpose was to concatenate the section files into one paper.md file, which also had to be converted into a paper.html file. The most time-consuming part of the project was writing the descriptions for each of the tools. Even though I had a general idea of how each of them worked, I had to consider how to explain these tools to others who might not know how to use them. This project took about 6 hours to complete. 

# Conclusions

These tools are incredibly helpful in many different projects, whether individual ones or team projects. Makefiles automate processes and commands that are likely to be repeated. Git allows the user to save different versions of their work and makes collaboration with others much easier, and Github allows this work be to be accessible on the web. Pandoc converts files in markup languages to other formats such as HTML and PDF. And finally Markdown is a simple easy-to-write language that converts nicely for web formats. Although it might take some additional time upfront to learn how to use these tools, they will ultimately save users a lot of time and effort in the long run for their future endeavors. 


![Creative Commons License BY](https://i.creativecommons.org/l/by/4.0/88x31.png)