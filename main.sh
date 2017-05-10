#!/bin/bash

#alias qui='/home/cordovatj/Documentos/personal/busqueda_quijote/main.sh'

RUTA=`dirname $0`

CAPITULO=`echo $1" "$2 | egrep '[0-9]+ [0-9]+' | wc -l`
LINEA=`echo $1" "$2" "$3 | egrep '[0-9]+ [0-9]+ [0-9]+' | wc -l`

if [ $LINEA -eq 1 ]; then

    #echo "linea"
    TOMO=$1
    CAP=$2
    NUM_LIN=$3

    if [ $CAP -lt 10 ]; then
	
	CAP=`echo "0${CAP}"`

    fi  

    if [ -f ${RUTA}/cap/T${TOMO}C${CAP} ];then
       nohup gedit ${RUTA}/cap/T${TOMO}C${CAP} +$NUM_LIN &
    else
	echo "No existe el capítulo T${TOMO}C${CAP}"
    fi

elif [ $CAPITULO -eq 1 ]; then 

    #echo "capitulo"
    TOMO=$1
    CAP=$2

    if [ $CAP -lt 10 ]; then
	
	CAP=`echo "0${CAP}"`

    fi
	
    if [ -f ${RUTA}/cap/T${TOMO}C${CAP} ];then
      nohup gedit ${RUTA}/cap/T${TOMO}C${CAP} &
    else
	echo "No existe el capítulo T${TOMO}C${CAP}"
    fi

else
	cd $RUTA

	I=`egrep -li "$*" cap/T1*|wc -l`
	if [ "$I" -gt 0 ]; then
		echo
		echo =========== TOMO I ===========
		echo
		egrep --color=auto -niC2 -T "$*" cap/T1* 
		echo
	fi

	I=`egrep -li "$*" cap/T2*|wc -l`
	if [ "$I" -gt 0 ]; then
		echo
		echo =========== TOMO II ===========
		echo
		egrep --color=auto -niC2 -T "$*" cap/T2* 
		echo
	fi
fi


 

