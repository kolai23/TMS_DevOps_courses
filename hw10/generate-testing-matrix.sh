#!/bin/bash
OS=(Ubuntu Fedora Centos)
arch=(x86_64 i686)

for i in ${OS[@]}; do
	for a in ${arch[@]}; do
		echo $i $a
	done

done
