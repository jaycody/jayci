#!/bin/bash



#jayhelp_pick () {
#    echo "\nWelcome to jayhelp function. Please pick an option"
#    read choice
#    echo -n "You entered $choice"
  #      case ${choice} in
  #          
  #          1) echo "1";; # jaylias;;
  #          2) echo "2";; # jaygit_branch;;
  #          3) echo "selection #4";; #jaygit_tags;;
  #          4) echo "selection #4";;
  #          *) echo "Not a valid choice!";;
  #      esac
#  exit 
#}

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

    # List aliases in .jayrc
    #jayci_announce "aliases===>"
        # '-E' search start of lines with word 'alias'
        # '-i' ignore uppercase
    #grep -Ei alias ./.jayrc 
    
    # list ALL aliases
     #   compgen -a  
    #echo ""
}


jayci_update_repos () {
    ########### GIT PULL to UPDATE ALL REPOS ############
    #  <the original code comes from the Chief Engineer at Padopolis 2011>
    #### archived repo list... 2017?
    #repos="hci_qa hci_qa.wiki jaycodylab.com jayjaycody.github.io jayjaycody.github.io.wiki 
            # lamp-stack lamp-stack.wiki mypy mypy.wiki nature-of-code-examples nodejs starnb.com swift 
            # test-automation test-automation.wiki wear web-app-tests web-dev web-dev.wiki"

    #DEBUG REQUIRED: How do we walk throug a list?? sounds simple enouch
    #repos=jayci jayutil kidsPace portal-control scripts snapcap the-unix-workbench-master utiliplate
    
    # remember where you are
    initialLocation = $(pwd)
    echo "Current location: ${initialLocation}"

    # Create an array of repos
    repos=(jayci snapcap)
    # iterate through the array
        # first checkout master, then git pull, THEN git status
    for i in ${repos[@]}
        do
	        jayci_announce "*** Updating ${i} ***"
	        cd "${JAYCI_WORKSPACE}/${i}"
            git checkout master
            git checkout main
            git pull
	        echo ""
        done

    for i in ${repos[@]}
        do
	        jayci_announce "*** Getting status on ${i} ***"
	        cd "${JAYCI_WORKSPACE}/${i}"
            l
            git status
	        echo ""
        done

    # return to initial location
    echo "Returned to initial location:"
    cd "${initialLocation}"
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



jayci_transfer_files () {
    # Leftovers from Padopolis 2011
        echo"transfer_file function disabled"
      #  if [ "$1" = hq ]
        #then
	#machineName=hq.machine.com
    #else
    #machineName=mymachine.local
    #fi

    #ssh  me@${machineName} "ls /lab/ios-releases/particles-*"

    #echo "Which file to transfer? "
    #read ans

    #scp me@${machineName}:$ans ~/temp
    }