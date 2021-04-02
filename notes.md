## notes 
> jayci
----------

### random bash notes

#### DEBUG bash scripts: Print script commands to stdout
Add `-x` to the `#!/bin/bash -x`



```bash
 ########### GIT PULL to UPDATE ALL REPOS ############
    #  <the original code comes from the Chief Engineer at Padopolis 2011>
    #### archived repo list... 2017?
    #repos="hci_qa hci_qa.wiki jaycodylab.com jayjaycody.github.io jayjaycody.github.io.wiki 
            # lamp-stack lamp-stack.wiki mypy mypy.wiki nature-of-code-examples nodejs starnb.com swift 
            # test-automation test-automation.wiki wear web-app-tests web-dev web-dev.wiki"
```


### Old Function to list aliases 
```bash
# Archived ---------- from .jayrc
   # List aliases in .jayrc
    #jayci_announce "aliases===>"
        # '-E' search start of lines with word 'alias'
        # '-i' ignore uppercase
    #grep -Ei alias ./.jayrc 
    
    # list ALL aliases
     #   compgen -a  
    #echo ""
############################
```


```bash
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
```



```bash
################ HOW WE USEDTA COULD ##############################
#   ---> People say it be like it is but it dont <----  #

# Find and source git-prompt.sh
#      (hardcoded list of .sh files? File an 'Enhancement Request Ticket')
#if [ -f ${JAY_SPACE}/jayci/scripts/.git-prompt.sh ]; then
#     printf '$ source ./scripts/.git-prompt.sh \n';
#     . ${JAY_SPACE}/jayci/scripts/.git-prompt.sh
#else
#     echo '.git-prompt.sh script does not exist'
#fi

# Source the utilities script
#if [ -f ${JAY_SPACE}/jayci/scripts/jayci_utilities.sh ]; then
#     printf '$ source ./scripts/jayci_utilities.sh';
#     . ${JAY_SPACE}/jayci/scripts/jayci_utilities.sh
#else
#     echo 'There are no utility scripts for jayci.cfg to source'
#fi
#echo '---------------------------------------------------------------'
```


```bash
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
```