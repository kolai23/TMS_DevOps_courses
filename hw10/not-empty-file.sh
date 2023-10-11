#!/bin/bash

while read file; do
	if [ -s $file ]; then
		echo $file
	fi
done
