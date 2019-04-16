#!/bin/bash
#Author: Richard T Swierk

#Function for the System Admin Menu
sysAdmin(){
	clear
	#prints out the options for the menu to the screen
	echo "==================== System Admin Menu ===================="
	echo "        To select an option enter the options number       "
	echo "1: List all running processes"
	echo "2: List all running services"
	echo "3: List all installed software"
	echo "4: List all users"
	echo "5: Return to main menu"
	echo "6: Exit"
	echo -n "Make a selection: "
	#reads what the user inputs and sends it to the variable selection
	read selection
	#Case statement to figure out which option the user picked
	case "$selection" in
		#Lists all running processes
		"1") clear; ps -aux | less;;
		#Lists all running services
		"2") clear; service --status-all | grep + | less;;
		#Lists all installed software
		"3") clear; dpkg -l | less;;
		#Lists all users
		"4") clear; awk -F':' '{print $1",",$3",",$4",",$6",",$7}' /etc/passwd | less;;
		#Returns user to the main menu
		"5") clear; mainMenu;;
		#Exits the program
		"6") exit;;
		*);;
	esac
}
#Function for the Security Admin Menu
secAdmin(){
	clear
	#prints out the options for the menu to the screen
	echo "==================== Security Admin Menu ===================="
	echo "         To select an option enter the options number        "
	echo "1: List last 10 logged in users"
	echo "2: Print the last 20 lines of an arbitrary file in the /var/log/ directory"
	echo "3: Run the command: netstat -apn --inet"
	echo "4: Use lsof to print the details of a specific process or process ID provided by the user"
	echo "5: Return to main menu"
	echo "6: Exit"
	echo -n "Make a selection: "
	#reads what the user inputs and sends it to the variable selection
	read selection
	#Case statement to figure out which option the user picked
	case "$selection" in
		#Lists last 10 logged in users
		"1") clear; last -n 10 | less;;
		#Prints the last 20 lines of a user difined file
		"2")
			clear
			ls -p /var/log/ | grep -v /
			echo -n "Enter the name of the file: "
			read file
			clear
			head -10 /var/log/$file | less;;
		#Runs the command netstat -apn --inet
		"3") clear; netstat -apn --inet | less;;
		#Uses lsof to print the details of a specific process or process ID provided by the user
		"4")
			clear
			ps -aux
			echo -n "Enter of the PID of the process: "
			read pid
			clear
			lsof -p $pid | less;;
		#Returns user to the main menu
		"5") mainMenu;;
		#exits the program
		"6") exit;;
		*);;
	esac
}
#Function for Main Menu 
mainMenu(){
	clear
	#prints out the options for the menu to the screen
	echo "==================== Main Menu ===================="
	echo "   To select an option enter the options number    "
	echo "1: System Admin"
	echo "2: Security Admin"
	echo "3: Exit"
	echo -n "Make a selection: "
	#reads what the user inputs and sends it to the variable selection
	read options
	#Case statement to figure out which option the user picked
	case "$options" in
		#Sends the user to the System Admin Menu
		"1") sysAdmin;;
		#Sends the user to the Security Admin Menu
		"2") secAdmin;;
		#Exits the program
		"3") exit;;
		*);;
	esac
mainMenu
