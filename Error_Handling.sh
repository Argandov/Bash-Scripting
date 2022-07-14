# Simple Bash function to handle erros and catch them into variables if they arise
#
# Catch: VAR=$(<Command> 2>&1) will execute the command but give no output at success. If there is any non-zero error it will catch it into the VAR
# It will execute the command, but give zero stdout, even when ls or echo.
#
# The idea is to execute commands and catch errors, not to print things to stdout.

_ERROR_HANDLE() {
		COMMAND=${@:2} # condense every argument (Like argv[2:])
		if [ $1 -eq 0 ]
		then 
				echo "[+] SUCCESS"
		else
				echo "[X] ERROR (CODE "$1"): \""$COMMAND"\""
				echo "    \nExiting..."
				exit 1
		fi
}


VAR1=$(ls / 2>&1)
_ERROR_HANDLE $? $VAR1

VAR2=$(ls /nonExistentFolder 2>&1)
_ERROR_HANDLE $? $VAR2
