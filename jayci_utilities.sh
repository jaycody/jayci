#! /bin/bash

######## TESTING TOOLS ###########

# Check the source pipeline
jayci_test_source_pipeline () {
    jayci_announce "jayci utility functions sourced: CHECK"
}




######### CONSOLE LOGGING UTILITIES ###########

# Write something to the console in red.
jayci_error () {
    local WHITE_ON_RED="\e[7;31m"
    local NORMAL="\e[0m"
    local LINE1=${1:-}
    local LINE2=${2:-}

    printf "${WHITE_ON_RED}======================================================================${NORMAL}\n"
    printf "${WHITE_ON_RED}  DSP:  %-60s  ${NORMAL}\n" "${LINE1}"
    if [ "${LINE2}" != "" ]
    then
        printf "${WHITE_ON_RED}  DSP:  %-60s  ${NORMAL}\n" "${LINE2}"
    fi
    printf "${WHITE_ON_RED}----------------------------------------------------------------------${NORMAL}\n"
}

# Write something to the console in blue.
jayci_announce () {
    local WHITE_ON_BLUE="\e[7;34m"
    local NORMAL="\e[0m"
    local LINE1=${1:-}
    local LINE2=${2:-}

    printf "${WHITE_ON_BLUE}======================================================================${NORMAL}\n"
    printf "${WHITE_ON_BLUE}  DSP:  %-60s  ${NORMAL}\n" "${LINE1}"
    if [ "${LINE2}" != "" ]
    then
        printf "${WHITE_ON_BLUE}  DSP:  %-60s  ${NORMAL}\n" "${LINE2}"
    fi
    printf "${WHITE_ON_BLUE}----------------------------------------------------------------------${NORMAL}\n"
}
