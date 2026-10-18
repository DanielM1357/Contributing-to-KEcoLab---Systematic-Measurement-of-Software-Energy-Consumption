# Performing a merge request

In order to perform a mere request to the KEcoLab project a fork of the [repository](https://invent.kde.org/sdk/kecolab/) has to be created than the forked repository has to be cloned locally with:
```bash
git clone <repository-URL>
```
Forking the repository will create a new version, so changes do not affect the original code.

Having cloned the repository to a local folder, changes to the code can be made. In order to do this, create a new branch with:
```bash
checkout -b <branch-name>
```
This will create a new branch and switch to it at the same time. 

After having changed the code itself, the normal procedure of:
```bash
git add <file>
git commit -m "I am a commit message"
git push
```
has to be done, so the changes will be pushed to the fork.

After pushing the link for creating a merge request is returned in the command-line and can be directly clicked. 

At this point it is **important to name the merge request by the flatpak URL** of the application - in this case the application is Okular, so the merge request has to be named `org.kde.okular`. 

This is important because **the pipeline build script takes the name as a variable** for the application to be started. 
