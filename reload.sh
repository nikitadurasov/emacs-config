#!/usr/bin/bash

# get newest version of configs
cd $(dirmame $BASH_SOURCE)
git pull origin master

# check if everything went fine
getExitCode=$?
if [[ $getExitCode != 0 ]]; then
    exit $getExitCode
fi

function clean() {
    get clean -nx
    read -p "Clean the above files (y/n)" -n 1
    echo "**** Processing ****"
    if [[ $REPLY =~ ^[Yy]$]]; then
	git clean -fx
    fi
}

function loadFilesInRoot() {
    for i in $(ls -a); do 
        if [ $i != '.' -a $i != '..' -a $i != '.git' -a $i != '.DS_Store' -a $i != 'bootstrap.sh' -a $i != 'README.md' -a $i != '.gitignore' -a $i != '.gitmodules' ]; then 
            echo "$i"
            cp -r "$i" "$HOME/"
	fi
    done
}

clean
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset clean
unset doIt


   

