#!/bin/bash
# cmpfiles.sh : compare files in 2 directories
# Usage: cmpfiles dir1 dir2
# compare normal files in 2 directories, report:
# which files are only in dir1
# which files are only in dir1
# which files are in both dir1 and dir2 

# is_el_of_arr() tests if a search string is equal to any element of an array
# returns 0 if the word is found, 1 otherwise
# first argument: name of the array variable
# first argument: search string
# second argument: the name of an array variable
# uses for loop
function is_el_of_arr {
    word=$1
    arrayname=$2
    for element in $(eval echo \${$arrayname[@]})
    do
        if [ "$word" == "$element" ]
        then 
            return 0
        fi
    done
    return 1
}

# is_el_of_AARR() tests if a search string is equal to any element of an 
# ASSOCIATIVE array
# returns 0 if the word is found, 1 otherwise
# first argument: name of the array variable
# first argument: search string
# second argument: the name of an array variable
# uses return code of [ ${array[key]} ]
function is_el_of_AARR {
    word=$1
    arrayname=$2
    if [ $(eval echo \${$arrayname[$word]}) ]
    then
        return 0
    else
        return 1
    fi
}

dir1=$1
dir2=$2
# not safe for file names with blanks !!!
dir1list=$( ls -pa $dir1 | grep -v / )
dir2list=$( ls -ap $dir2 | grep -v / )


echo
echo test is_el_of_arr
echo

for name in ${dir1list[@]}
do
    if ! is_el_of_arr $name dir2list
    then
        echo "only in ${dir1}: $name"
    fi
done

for name in ${dir2list[@]}
do
    if ! is_el_of_arr $name dir1list
    then
        echo "only in ${dir2}: $name"
    fi
done

for name in ${dir2list[@]}
do
    if is_el_of_arr $name dir1list
    then
        echo "in both: $name"
    fi
done

echo
echo test is_el_of_AARR
echo

declare -A dir1list
declare -A dir2list

# populate dir1list with the results of ls -p
# use filename as key and as value
for name in $(ls -pa $dir1 | grep -v / )
do
    $dir1list[$name]=$name
done

# populate dir2list with the results of ls -p
# use filename as key and as value
for name in $(ls -pa $dir2 | grep -v / )
do
    $dir2list[$name]=$name
done

# use direct test if element exists in associative array 
for name in ${dir1list[@]}
do
    if ! [ ${dir2list[$name]} ]
    then
        echo "only in ${dir1}: $name"
    fi
done

for name in ${dir2list[@]}
do
    if ! [ ${dir1list[$name]} ]
    then
        echo "only in ${dir2}: $name"
    fi
done

for name in ${dir2list[@]}
do
    if ! [ ${dir1list[$name]} ]
    then
        echo "in both: $name"
    fi
done
