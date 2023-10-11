#!/bin/bash

[[ $1 =~ ^[-+]?[0-9]+$ ]] && NUM=$1 || { echo "Не является числом"; exit 1; }

case "$(($NUM % 2))" in
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