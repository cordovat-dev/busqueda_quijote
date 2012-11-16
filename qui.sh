#!/bin/sh

RUTA=`dirname $0`
grep -niA2 -B2 $1 ${RUTA}/qui*
