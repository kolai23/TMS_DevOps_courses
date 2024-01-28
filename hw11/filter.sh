#!/bin/bash
function parse_file()
{
	while read -r template;	do	
		echo $template
		shift
	done
}

function parse_param()
{
	case $1 in
		contains )	
			for arg1 in "${@:2}"; do
				cat "$OPTARG" | parse_file | grep $arg1		
			done
		;;
		startswith )
			for arg2 in "${@:2}"; do
				cat "$OPTARG" | parse_file | grep -w "^${arg2}*"
			done
		;;
		endswith )
			for arg3 in "${@:2}"; do
			cat "$OPTARG" | parse_file | grep "${arg3}$"
			done
	;;
	esac
}

function parse_param_file()
{
	case $1 in
		contains )
			while [ -n "$2" ]
			do
				parse_file | grep -rh "${2}"
				shift
			done
			;;
		startswith )
			while [ -n "$2" ]
			do
				parse_file | grep -rh "^${2}"
				shift
			done
		;;
		endswith )
			while [ -n "$2" ]
			do
				parse_file |  grep -rh  "${2}$"
				shift
			done
		;;
	esac
}
if getopts "f:" ff; then
	case $ff in
	f)
		parse_param "${@:3}"
		;;
	?)
		echo "Некорректное использование скрипта. Пример: $0 -f filename"
		exit 1
		;;
	esac
else
	parse_param_file "$@" 
fi
