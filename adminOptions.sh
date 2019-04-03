#!/bin/bash
#Author: Richard T Swierk

sysAdmin(){
        clear
        echo "==================== Main Menu ===================="
        echo "   To select an option enter the options number    "
        echo "1: List all running processes"
        echo "2: List all running services"
        echo "3: List all installed software"
        echo "4: List all users"
        echo "5: Return to main menu"
        echo "6: Exit"
        echo -n "Make a selection: "
        read selection
        if [ $selection == 1 ];then
                listProc
        elif [ $selection == 2 ];then
                listServ
        elif [ $selection == 3 ];then
                listSoft
        elif [ $selection == 4 ];then
                listUsers
        elif [ $selection == 5 ];then
                mainMenu
        elif [ $selection == 6 ];then
                exit
        fi
}

secAdmin(){
        clear
        echo "==================== Main Menu ===================="
        echo "   To select an option enter the options number    "
        echo "1: List last 10 logged in users"
        echo "2: Print the last 20 lines of an arbitrary file in the /var/log/ directory"
        echo "3: Run the command: lsof -i -n"
        echo "4: Use lsof to print the details of a specific process or process ID provided by the user"
        echo "5: Return to main menu"
        echo "6: Exit"
        echo -n "Make a selection: "
        read selection
        if [ $selection == 1 ];then
                logs
        elif [ $selection == 2 ];then
                listServ
        elif [ $selection == 3 ];then
                listSoft
        elif [ $selection == 4 ];then
                listUsers
        elif [ $selection == 5 ];then
                mainMenu
        elif [ $selection == 6 ];then
                exit
        fi
}

mainMenu(){
        clear
        echo "==================== Main Menu ===================="
        echo "   To select an option enter the options number    "
        echo "1: System Admin"
        echo "2: Security Admin"
        echo "3: Exit"
        echo -n "Make a selection: "
        read options
        if [ $options == 1 ];then
                sysAdmin
        elif [ $options == 2 ];then
                secAdmin
        elif [ $options == 3 ];then
                exit
        fi
}
