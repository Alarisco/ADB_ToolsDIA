#!/bin/bash
#Tool = ADB_ToolsDia v2
#Author = Alvaro Alonso
#Date = 2022

clean_exit () {

    rm -rf $PWD/.temp/* &> /dev/null
    rm -rf $PWD/1 &> /dev/null
    rm -rf $PWD/2 &> /dev/null
    clear && echo -e "\nCtrl-C pulsado...Limpiando script.\n" && sleep 0.5
    echo -e "Saliendo de la Herramienta"
    echo -e "\nLISTO. CHAO"
    exit
}

trap_ctrlc () {
    clean_exit
}

trap "trap_ctrlc" 2

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
}

option_list () {

banner
echo -e "\n\n\e[1;4;91mESCOGE UNA OPCION:\e[0m\n\n"
echo -e "\e[1;93m1.   \e[1;92mMOSTRAR DISPOSITIVOS CONECTADOS                           \e[1;93m16.  \e[1;92mMOVER FICHERO AL DISPOSITIVO"
echo -e "\e[1;93m2.   \e[1;92mREINICIAR EL SERVICIO ADB                                 \e[1;93m17.  \e[1;92mPURGA DIRECTORIOS DIA (dia, DIA, dia_1...)"                                
echo -e "\e[1;93m3.   \e[1;92mREINICIAR EL TERMINAL CONECTADO"
echo -e "\e[1;93m4.   \e[1;92mLANZA UNA CONSOLA ADB_SHELL                               \e[1;93m18.  \e[1;92mEJECUTA UNA APLICACION "
echo -e "\e[1;93m5.   \e[1;92mINFORMACION DEL TERMINAL COMPLETA                         \e[1;93m19.  \e[1;92mEJECUTA APP GESTION TIENDA DIA% "
echo -e "\e[1;93m6.   \e[1;92mINFORMACION DEL TERMINAL RESUMEN                          \e[1;93m20.  \e[1;92mEJECUTA APP QUICK_SUPPORT "
echo -e "\e[1;93m7.   \e[1;92mINSTALA UNA APLICACION 'apk'                              \e[1;93m21.  \e[1;92mEJECUTA AUTOCONEXION WIFI DIA "
echo -e "\e[1;93m8.   \e[1;92mDESINSTALA UNA APLICACION"
echo -e "\e[1;93m9.   \e[1;92mLISTA DE TODAS LAS APKS INSTALADAS                        \e[1;93m22.  \e[1;92mCOMPRUEBA SI APK ESTA INSTALADA EN TERMINAL "
echo -e "\e[1;93m10.  \e[1;92mTAILOG DEL TERMINAL                                       \e[1;93m23.  \e[1;92mCOMPRUEBA SI ESTA CONECTADO A WIFI O DATOS"
echo -e ""
echo -e "\e[1;93m11.  \e[1;92mCOPIA TODA LA CARPETA DCIM                                \e[1;93m24.  \e[1;92mINSTALA APP GESTION TIENDA "
echo -e "\e[1;93m12.  \e[1;92mCOPIA TODA LA CARPETA DOWNLOAD                            \e[1;93m25.  \e[1;92mDESINSTALA APP GESTION TIENDA "
echo -e "\e[1;93m13.  \e[1;92mCOPIA TODA LA CARPETA DIA% (Subida a HSR opcional)"
echo -e "\e[1;93m14.  \e[1;92mCOPIA COMPLETA DEL TERMINAL ( Lleva tiempo )              \e[1;93m26.  \e[1;92mGRABACION O CAPTURA PANTALLA DEL TERMINAL"             
echo -e "\e[1;93m15.  \e[1;92mCOPIA UN ARCHIVO O CARPETA ESPECIFICA DEL TERMINAL"
echo -e "                                                           \e[1;91mPRESIONA Ctrl+c o E PARA SALIR Y LIMPAR SCRIPT\n"
echo -e $revised
read -p $'\e[1;4;91mINTRODUCE EL NUMERO DE LA OPCION QUE DESEAS EJECUTAR\e[0m\e[24;1;97m : ' options
}

revised=""
option_list

##COMIENZA EL LOOP

while [ 1 ]
do

case $options in

      "1") echo -e; bash modulos/opt1;;
      "2") echo -e; bash modulos/opt2;;
      "3") echo -e; bash modulos/opt3;;
      "4") echo -e; bash modulos/opt4;;
      "5") echo -e; bash modulos/opt5;;
      "6") echo -e; bash modulos/opt6;;       
      "7") echo -e; bash modulos/opt7;;       
      "8") echo -e; bash modulos/opt8;;       
      "9") echo -e; bash modulos/opt9;;       
      "10") echo -e; bash modulos/opt10;;       
      "11") echo -e; bash modulos/opt11;;       
      "12") echo -e; bash modulos/opt12;;
      "13") echo -e; bash modulos/opt13;;
      "14") echo -e; bash modulos/opt14;;
      "15") echo -e; bash modulos/opt15;;
      "16") echo -e; bash modulos/opt16;;
      "17") echo -e; bash modulos/opt17;;
      "18") echo -e; bash modulos/opt18;;
      "19") echo -e; bash modulos/opt19;;
      "20") echo -e; bash modulos/opt20;;
      "21") echo -e; bash modulos/opt21;;
      "22") echo -e; bash modulos/opt22;;
      "23") echo -e; bash modulos/opt23;;
      "24") echo -e; bash modulos/opt24;;
      "25") echo -e; bash modulos/opt25;;
      "26") echo -e; bash modulos/opt26;;
      "e") echo -e; clean_exit;;

      *) clear; revised="\e ERROR, ENTRADA NO RECONOCIDA\n"; option_list;;

esac

done
