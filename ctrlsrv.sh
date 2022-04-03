#!/bin/bash
clear
if (( $EUID != 0 )) # $EUID = 0 if you are running the script with root privileges
then
  echo "This script must be run as a root"
  exit 1 
fi


function mostra_serveis(){
echo "Seleciona uno de los servicios:"
echo "a) Ejecuta cups"
echo "b) Ejecuta ssh"
echo "c) Ejecuta apache2"
read opciones
	case $opciones in
	
		a)
			ctrl_cups
		;;
		b)
			ctrl_ssh
		;;
		c)
			ctrl_apache2
		;;
	esac
	
}

function ctrl_cups(){
	
	if [[ ! "$(/sbin/service cups status)" =~ "running" ]]
then
    service cups start
    fi
}


function ctrl_ssh(){
	
	if [[ ! "$(/sbin/service ssh status)" =~ "running" ]]
then
    service ssh start
    fi
}


function ctrl_apache2(){
	
	if [[ ! "$(/sbin/service apache2 status)" =~ "running" ]]
then
    service apache2 start
    fi
}


mostra_serveis
exit 0
