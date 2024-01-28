#!/bin/bash
function parse_param()
{
	while read -r template;	do		
		echo "$template" | envsubst 
	done
}

if getopts "f:" ff; then
  case $ff in
	f)	
        for arg in "${@:3}"; do
        export "$arg"
        done
        cat "$OPTARG" | parse_param 
        exit 0
		;;
	?)
		echo "Некорректное использование скрипта. Пример: $0 -f filename"
		exit 1
		;;
	esac
else
    for arg in "${@:1}"; do
    export "$arg"
    done
    parse_param 
fi


