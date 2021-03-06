#!/bin/bash
echo "*~" > .gitignore
echo ".svn" >> .gitignore
echo ".git" >> .gitignore
echo "*#" >> .gitignore

INPUT=repos.csv
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read reponame repourl
do
    if [[ -n "$reponame" && -n "$repourl" && $reponame != "reponame" && $repourl != "repourl" ]]; then
        echo "Creating $reponame ..."
        #echo "$reponame" >> .gitignore
        rm -rf "$reponame" 
        mkdir -p "$reponame"
        svn checkout "$repourl" "$reponame"
    fi
done < $INPUT
IFS=$OLDIFS

