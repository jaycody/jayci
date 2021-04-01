#! /bin/bash


jaylias () {
    #---------Begin here document------------#
    cat <<_EOF_ 

    ***********Aliases and Functions**********
    jaylias:  HERE doc for aliases and functions

    lalias:   list aliases
    lsls:     list the 'ls' family
                # "grep 'alias l' in .jayrc"

    -----------TAKE ME TO....-------------
    jaycody jayci repo repocm 
    code foo: open foo in VSCode

    -----------OPEN IN VIM-------------
    vimjrc, vimjconfig, vimjutil, vimvimrc, vimzrc

    -----------INFO-------------
    h=history, path, gitlog
    du, df, dirsize -- disk used, disk free, dirsize

    -----------LIST-------------
    ls    ='ls -hF'

    lk  ='ls -AlSro'    # Size: biggest last.
    lt  ='ls -Altro'    # Date: recent last.
    lc  ='ls -Altcro'   # Change: recent last.

    l   ='ls -A1'       # 1 col, show: .dot and '/', '*'
    la  ='ls -A'        # .dot files, '/' dirs
    ll  ='ls -Alo'      # .dot, -v, '/' dirs, no group,
    lal ='ls -al'       # Show hidden and long
    lsd ='\ls -A1 -d */'# Directories only
    lr  ='ls -R'        # Recursively

    -----------FREQUENT COMMANDS-------------
    grep:  search the file
    find:  walk a File Directory
    whereis:  ex. whereis python = 
    rm -rf: remove directory and all files therein, without asking permission
    cp -r:  copy directory and all files therein
    mkdir -p: make mutliptle directories along the path as needed
    ">" :   takes output of command at left and WRITES it to file on right
        -----ex  cat my.txt ">" your.txt
        ----- OR write directly to a file:  cat ">" foo.txt
_EOF_
#---------Begin here document------------#
}

jaygit_tags () {
    cat <<_EOF_

# list local tags [-n for extensive]
    git tag -n

# create local tag with annotations
    git tag -a <tag_name> -m "<tag_annotation>"

# delete local tag
    git tag -d <tag_name>

# view tag contents
    git show <tag_name>

# push local tags to remote
    git push --tags

# pull remote tags
    git fetch --all --tags
    
_EOF_
}

jaygit_branch () {
    cat <<_EOF_

# create feature branch
    git checkout -b <feature_branch> master
    git push -u origin <feature_branch>

# update local feature branch with master
    git checkout master
    git pull
    git checkout <feature_branch>
    git merge master

# list branches
    git branch -a

# delete local feature branch
    git branch -d <feature_branch>

# delete remote feature branch
    git push origin --delete <feature_branch>

# safely abort a merge that isn't going well
    git merge --abort



_EOF_
}
