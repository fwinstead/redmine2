#!/bin/bash


# FTW 2017-04-17


# check to see if packages are up to date
# 	download if needed

DOWNLOAD_DIR="${OPENSHIFT_REPO_DIR}downloads"
if [ \! -d "${DOWNLOAD_DIR}" ] ; then mkdir -vp "${DOWNLOAD_DIR}"; fi

export RUBY_VER="2.3.4"
TO_DOWNLOAD=("https://cache.ruby-lang.org/pub/ruby/2.3/ruby-${RUBY_VER}.tar.gz")

# Retrieve files
pushd "${DOWNLOAD_DIR}"
	for ((i = 0; i < ${#TO_DOWNLOAD[@]}; i++))
	do
		STATUS="FAIL"
		NOW=$(date "+%Y_%m_%d_%H_%M_%S")
		CMD="wget -nv ${TO_DOWNLOAD[$i]}"
		echo -e "\t${NOW} ${CMD}" 
		eval $CMD
		if [ $? = 0 ] ; then STATUS="Success"; fi
		echo -e "\t\t${STATUS}."
	done
popd

echo "$0 Finished"
# ## ### #### ##### #### ### ## #
