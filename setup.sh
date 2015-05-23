#!/bin/bash
#
# Copyright (C) 2014 Wenva <lvyexuwenfa100@126.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is furnished
# to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

set -e

VERSION=1.0.0

info() {
     local green="\033[1;32m"
     local normal="\033[0m"
     echo "[${green}INFO${normal}] $1"
}

error() {
     local red="\033[1;31m"
     local normal="\033[0m"
     echo "[${red}ERROR${normal}] $1"
}

usage() {
cat << EOF

USAGE: $0 install/uninstall

DESCRIPTION:
    install - install jssh to system path
    uninstall - uninstall jssh from system path

EOF
}

# Check Java Environment
command -v java >/dev/null 2>&1 || { error >&2 "This tool depends on java, Please install java first."; exit -1; }

# Check Command Param
if [ $# != 1 ];then
    usage
    exit -1
fi

INSTALL=
if [ $1 == "install" ];then
    INSTALL=1
elif [ $1 == "uninstall" ];then
    INSTALL=0
else
    usage
    exit -1
fi

# Build and Install
if [ `uname` == "Darwin" ];then
    BASH_PROFILE=~/.bash_profile
    sed -i '' '/export CLASSPATH=/'d $BASH_PROFILE
    sed -i '' '/alias jssh=/'d $BASH_PROFILE
else
    user = `who am i|awk '{print $1}'`
    echo user
    if [ $user != "root" ];then
        BASH_PROFILE=/home/user/.bash_profile
    fi
    sed -i '/export CLASSPATH=/'d $BASH_PROFILE
    sed -i '/alias jssh=/'d $BASH_PROFILE
fi

BASH_PROFILE_TMP=$BASH_PROFILE.tmp
touch $BASH_PROFILE

if [ $INSTALL == 1 ];then
    info "install jssh..."
    javac -d /usr/lib jssh.java
    awk '{print $0}END{print "export CLASSPATH=$CLASSPATH:/usr/lib"}' $BASH_PROFILE > $BASH_PROFILE_TMP
    awk '{print $0}END{print "alias jssh=\"java jssh\""}' $BASH_PROFILE_TMP > $BASH_PROFILE
    rm $BASH_PROFILE_TMP
else
    info "uninstall jssh..."
    rm /usr/lib/jssh.class
fi

source $BASH_PROFILE


