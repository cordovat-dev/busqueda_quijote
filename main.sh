#!/bin/bash

#alias qui='/home/cordovatj/Documentos/personal/busqueda_quijote/main.sh'

RUTA=`dirname $0`

CAPITULO=`echo $1" "$2 | egrep '[0-9]+ [0-9]+' | wc -l`

if [ $CAPITULO -eq 1 ]; then

    TOMO=$1
    CAP=$2

    if [ $CAP -lt 10 ]; then
	
	CAP=`echo "0${CAP}"`

    fi
	
    if [ -f ${RUTA}/cap/T${TOMO}C${CAP} ];then
       gnome-open ${RUTA}/cap/T${TOMO}C${CAP}
    else
	echo "No existe el capítulo T${TOMO}C${CAP}"
    fi

    
else
	cd $RUTA
	#grep --color=auto -niA2 -B2 $1 ${RUTA}/qui*
	grep --color=auto -niA2 -B2 "$*" cap/T* 
fi


 

