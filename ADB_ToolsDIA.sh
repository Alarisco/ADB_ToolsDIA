#!/bin/bash
#Tool = ADB_ToolsDia v2
#Author = Alvaro Alonso
#Date = 2022

current_version=2.0.1

echo -e "Herramientas ADB para terminales DIA%\n\n"

echo -e "Comprobando si hay una nueva versión"

check_new_version () {

    if ping -q -c 1 -W 1 google.com >/dev/null; then
        checked_version=$(curl -s https://raw.githubusercontent.com/Alarisco/ADB_ToolsDIA/main/modulos/version)
        if [ "$checked_version" != "$current_version" ]
            then
                echo -e "Current Version = $current_version , New Version = $checked_version"
                echo -e "\n\e[91;7mHay una nueva version disponible\e[27m\n"
                curl -s https://raw.githubusercontent.com/Alarisco/ADB_ToolsDIA/main/changelog/changelog.txt
                sleep 5 | echo -e "\e[93;5mEspera 5s o solicita la ultima versión\e[0m"

        fi
    fi

}

check_new_version

if [ $(id -u) -ne 0 ]; then
        echo "EJECUTA EL SCRIPT CON SUDO"
        exit 1
fi

if [ -d $PWD/.temp/ ]
    then
        echo -e "Carpeta .temp detectada" && clear
    else
        echo -e "Creando carpera .temp" && clear
        mkdir .temp
        echo -e "Carpeta .temp creada" && clear
fi



adb_check=$(which adb) 

if [ "$?" == 0 ]; then
    echo -e "ADB INSTALADO\n"
    echo -e "INICIANDO ADB\n"
else
    echo -e "\nADB NO ESTA INSTALADO EN ESTE EQUIPO"
    exit 1
fi

while true; do
    read -p $'\e[93;1mQuieres matar y reiniciar el servicio ADB\e[1;97m (Y/N) \e[93;1m? : \e[1;91m' yn
    case $yn in
    [Yy]* ) adb kill-server >/dev/null 2>&1 | echo -e "\n\nParando ADB" ;adb start-server >/dev/null 2>&1 | echo -e "\n\nIniciando ADB." ;break;;
    [Nn]* )  echo -e "Continuamos" ;break;;
    * ) echo -e "\e[1;93m Por favor escribe\e[1;97m Yy o Nn\e[0m";;
    esac
    done

clear

banner () {

echo -e "\e[1;93m

 █████╗ ██████╗ ██████╗               ████████╗ ██████╗  ██████╗ ██╗     ███████╗    ██████╗ ██╗ █████╗ ██╗ ██╗
██╔══██╗██╔══██╗██╔══██╗              ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝    ██╔══██╗██║██╔══██╗╚═╝██╔╝
███████║██║  ██║██████╔╝    █████╗       ██║   ██║   ██║██║   ██║██║     ███████╗    ██║  ██║██║███████║  ██╔╝ 
██╔══██║██║  ██║██╔══██╗    ╚════╝       ██║   ██║   ██║██║   ██║██║     ╚════██║    ██║  ██║██║██╔══██║ ██╔╝  
██║  ██║██████╔╝██████╔╝                 ██║   ╚██████╔╝╚██████╔╝███████╗███████║    ██████╔╝██║██║  ██║██╔╝██╗
╚═╝  ╚═╝╚═════╝ ╚═════╝                  ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝    ╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝ ╚═╝
██╗   ██╗██████╗                                                                                               
██║   ██║╚════██╗                                                                                              
██║   ██║ █████╔╝                                                                                              
╚██╗ ██╔╝██╔═══╝                                                                                               
 ╚████╔╝ ███████╗                                                                                              
  ╚═══╝  ╚══════╝                                                                                              
                                                                                                               


\e[0m"
echo
echo -e "\e Por Alvaro Alonso\e[0m"
}
bash modulos/funcion.sh