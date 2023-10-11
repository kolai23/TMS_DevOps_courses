#!/bin/sh

inp=$1 

if ( expr "$inp" : "[0-9]" > /dev/null ); then
	case "$(($inp % 2))" in
	0)
		echo "Чётное"
		;;
	1 | -1)
		echo "Нечетное"
		;;
	*)
		exit 0
		;;
	esac
else
	echo "Не является числом"
	exit 1
fi
