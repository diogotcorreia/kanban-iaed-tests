#!/bin/bash

### Make files are efficient and all but this is a tiny project, compiling it more times than necessary is not that much of a bother...
### Written by Raf 2021-03-29

correctdir="kanban-iaed-tests"
exename="exe_tmp"

GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m"

if [ "${PWD##*/}" != "$correctdir" ]; then
	echo Please run this script in the $correctdir directory!
	exit
fi

if [ $# -lt 1 ]; then
	echo Please provide the location of your .c files as an argument to this script!
	echo "Make sure it is a valid path (for example, ../proj)"
	echo "You can also provide 'clean' to get rid of those nasty .diff and .myout files!"
	exit
fi

rm -f tests/*.diff tests/*.myout

if [ "$1" = "clean" ]; then
	echo "All squeaky clean!"
	exit
fi

echo Hi $USER! Let\'s get this party started!

gcc -ansi -pedantic -Wall -Wextra -o $exename $1/*.c

passed=0
total=0

echo ----------

for tid in tests/*.in
do
	((total++))
	tid=$(basename -s .in $tid)
	./$exename < tests/$tid.in > tests/$tid.myout
	diff -u tests/$tid.myout tests/$tid.out > tests/$tid.diff # original didn't use -u but ok
	
	if [ "$(wc -l < tests/$tid.diff)" -eq 0 ]; then
		status="${GREEN}PASSED${NC}"
		((passed++))
	else
		status="${RED}FAILED${NC}"
	fi

	echo -e "> Test $tid - $status"
done

rm -f $exename

echo ----------

if [ $passed -eq $total ]; then
	echo -e "Result: ${GREEN}ALL CLEAR! :)${NC}"
else
	echo -e "Result: ${RED}Some tests failed :(${NC}"
fi
