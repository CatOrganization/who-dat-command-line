# who-dat-command-line 
Everything we do in the cat house


When you want to clone into existing repository:

    git init
    git remote add origin PATH/TO/REPO
    git fetch
    git reset origin/ricky-osx // This one is only necessary if files from the repo existed in the folder to begin with
    git checkout -t origin/<branch-name>
