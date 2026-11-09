#! /bin/zsh


# Check the source pipeline
jayci_test_source_pipeline () {
    
    # List the functions made available by this utility script
    echo ""
    jayci_error "Source pipeline verified..."
    echo ""

    # List functions made available by this setu
    jayci_announce "functions from jayci_utilities.sh ===>"
    jayci_functions
    echo ""
}

# update all project repos in JAY_SPACE
jayci_update_repos () { 
    src 
    for i in $( lsd ) ; do (
        jayci_announce "pulling and updating $i"
        cd "$i"

        # 2026-11-09: ask git for the repo's default branch (main or master)
        # instead of a hardcoded list. Old if/else in FOSSIL RECORD.
        # Not a git repo? skip it.
        git rev-parse --git-dir > /dev/null 2>&1 || { echo "not a git repo, skipping"; exit 0; }
        local DEFAULT_BRANCH CURRENT_BRANCH
        DEFAULT_BRANCH=$(git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null)
        DEFAULT_BRANCH=${DEFAULT_BRANCH#origin/}
        DEFAULT_BRANCH=${DEFAULT_BRANCH:-master}
        CURRENT_BRANCH=$(git branch --show-current)

        # Never switch branches: work in progress stays where it is.
        if [[ "${CURRENT_BRANCH}" == "${DEFAULT_BRANCH}" ]]
        then
            git pull
        else
            echo "on ${CURRENT_BRANCH:-a detached HEAD}, not ${DEFAULT_BRANCH}: fetching only, not switching"
            git fetch
        fi
        git status
        echo "-----------------------------"
        echo ""
        echo ""
    )
    done
    unsrc
}



######### CONSOLE LOGGING UTILITIES ###########
# Takes string and writes it to the console in red.
jayci_error () {
    local WHITE_ON_RED="\e[7;31m"
    local NORMAL="\e[0m"
    local LINE1=${1:-}
    local LINE2=${2:-}

    printf "${WHITE_ON_RED}========================================================================${NORMAL}\n"
    printf "${WHITE_ON_RED}  jayci:  %-60s  ${NORMAL}\n" "${LINE1}"
    if [ "${LINE2}" != "" ]
    then
        printf "${WHITE_ON_RED}  jayci:  %-60s  ${NORMAL}\n" "${LINE2}"
    fi
    printf "${WHITE_ON_RED}------------------------------------------------------------------------${NORMAL}\n"
}

# Takes string and writes it to the console in blue.
jayci_announce () {
    local WHITE_ON_BLUE="\e[7;34m"
    local NORMAL="\e[0m"
    local LINE1=${1:-}
    local LINE2=${2:-}

    printf "${WHITE_ON_BLUE}========================================================================${NORMAL}\n"
    printf "${WHITE_ON_BLUE}  jayci:  %-60s  ${NORMAL}\n" "${LINE1}"
    if [ "${LINE2}" != "" ]
    then
        printf "${WHITE_ON_BLUE}  jayci:  %-60s  ${NORMAL}\n" "${LINE2}"
    fi
    printf "${WHITE_ON_BLUE}------------------------------------------------------------------------${NORMAL}\n"
}



# List my homemade functions (defined above)
jayci_functions () {
    echo ""     # 2026-11-09: was echo"" (missing space)
    jayci_announce "functions ===>"
    print -l ${(ok)functions} | grep jayci
    echo ""     # 2026-11-09: was echo"" (missing space)
    
    jayci_announce "snapcap functions ===>"
    print -l ${(ok)functions} | grep snap_
    echo ""     # 2026-11-09: was echo"" (missing space)
}




#===============================================================
###            >>> FOSSIL RECORD <<<
#===============================================================
# Moved here 2026-11-09 (Claude, modernize-2026 branch).
# WHY: hardcoded which repos use `main`; new repos (and snapcap-made
#      projects) would hit `git checkout master` and fail. Now asks git.
#---------------------------------------------------------------
#        if [[ "${i}" == "snapcap/" ]] || [[ "${i}" == "marching-squares/" ]]
#        then 
#            git checkout main
#        else
#            git checkout master
#        fi
#===============================================================
