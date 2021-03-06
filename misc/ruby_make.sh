#!/bin/bash


# FTW 2017-04-17


# build Ruby 

export ROOT_DIR="${OPENSHIFT_HOMEDIR}app-root/runtime"
export LIB_DIR="${ROOT_DIR}/lib"	
export CONF_DIR="${OPENSHIFT_REPO_DIR}conf"

##################################################
# Ruby make/install

# time consuming, about 25 minutes, pass NOMAKE=1 to skip step
# MAKE begin

RUBY_TAR_PATH="ruby-${RUBY_VER}.tar.gz"

if test -z "${NOMAKE}"
then
	pushd ${DOWNLOAD_DIR}
	# untar Ruby source code
	tar -zxf "${RUBY_TAR_PATH}"
	pushd ruby-${RUBY_VER}    # Created by previous line 
  
		[ ! -f Makefile ] && ./configure --prefix=${ROOT_DIR} --with-libdir=lib64 
			
		echo "=====> Configure completion $?"
		make -j 4 # -j     # maybe: make -j 2
		echo "=====> Make completion $?"
    
		make install
    
		# NEED: look at make install, use: make -n install
		strip ${OPENSHIFT_HOMEDIR}app-root/runtime/bin/ruby
	popd
	popd
fi # MAKE end

echo -e "\t$(date) Ruby make: Normal Finish"

# ## ### ####
