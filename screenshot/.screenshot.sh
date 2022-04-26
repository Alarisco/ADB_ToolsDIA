#!/bin/bash
#Tool = ADB_ToolsDia v2
#Author = Alvaro Alonso
#Date = 2022

set -euo pipefail
IFS=$'\n\t'

function takeScreenshot(){
    echo -e "\e[1;93mTRealizando captura '${FILENAME}'...\n\e[91m"
    adb -s $devv shell screencap -p /sdcard/${FILENAME}
	echo -e "\e[1;92mProceso correcto.\n"
}

function pullScreenshot(){
    echo -e "\e[1;93mTransfiriendo a carpeta screenshot '${FILENAME}' desde dispositivo...\n\e[91m"    
    adb -s $devv  pull /sdcard/${FILENAME} screenshot/${FILENAME}
    echo -e "\n\e[1;92mProceso correcto.\n"
}

function deleteScreenshotFromDevice(){
    echo -e "\e[1;93mDeleting screenshot '${FILENAME}' desde dispositivo...\n\e[91m"
    adb -s $devv shell rm /sdcard/${FILENAME}
    echo -e "\e[1;92mProceso correcto."
    exit 0
}

[[ $# -eq 1 ]] || { echo; }

for _ARGUMENT in "$@"
do
    case ${_ARGUMENT} in
        -h|--help)
        usage
        ;;
        *)
        if [[ ! ${_ARGUMENT} =~ ^.*png$ ]]; then
            FILENAME="${_ARGUMENT}.png"
        else
            FILENAME="${_ARGUMENT}"
        fi
        ;;
    esac
done

takeScreenshot
pullScreenshot
deleteScreenshotFromDevice 