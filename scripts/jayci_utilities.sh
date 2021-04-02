#! /bin/zsh


# Check the source pipeline
jayci_test_source_pipeline () {
    
    # List the functions made available by this utility script
    echo ""
    jayci_error "Source pipeline verified..."
    echo ""

    # List functions made available by this setu
    jayci_announce "functions from jayci_utilities.sh ===>"
    compgen -A function | grep jayci
    echo ""
}

# update all project repos in JAY_SPACE
jayci_update_repos () { 
    src 
    for i in $( lsd ) ; do (
        jayci_announce "pulling and updating $i"
        cd $i
        
        if [[ "${i}" == "snapcap/" ]] || [[ "${i}" == "marching-squares/" ]]
        then 
            git checkout main
        else
            git checkout master
        fi

        git pull
        git status
        echo "-----------------------------"
        echo ""
        echo ""
    )
    done
    unsrc
}



######### CONSOLE LOGGING UTILITIES ###########
# Write something to the console in red.
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

# Write something to the console in blue.
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



# List the functions made available by this utility script
jayci_functions () {
    echo""
    jayci_announce "functions ===>"
    compgen -A function | grep jayci
    echo""
    
    jayci_announce "snapcap functions ===>"
    compgen -A function | grep snap_
    echo""
}

