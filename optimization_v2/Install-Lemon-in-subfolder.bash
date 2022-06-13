#!/bin/bash

DIR=$PWD
VERSION=1.3.1
echo
echo "Lemon package will be installed in folder"
echo
echo $DIR/lemon/lemon-$VERSION
echo
read -p "Do you confirm? [yY/nN]: " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi

echo "Lemon folder:"
echo $DIR
echo
#==========================================|==========================================
if [ -w $DIR ] ; then
    echo 'User has write permission!' ;
else
    echo 'ERROR: User has no write permission in this folder!' ;
    exit
fi
mkdir $DIR/lemon
cd $DIR/lemon
wget http://lemon.cs.elte.hu/pub/sources/lemon-${VERSION}.tar.gz
if [ ! -f lemon-${VERSION}.tar.gz ]; then
    echo "Could not download lemon-"${VERSION}".tar.gz file"
    exit
else
    echo "File lemon-"${VERSION}".tar.gz downloaded."
fi
tar -xzvf lemon-${VERSION}.tar.gz
cd lemon-${VERSION}
LEMONDIR=$PWD
echo "Lemon version folder:"
echo $LEMONDIR
mkdir build
#cd build
#cmake -DCMAKE_INSTALL_PREFIX=$LEMONDIR -DLEMON_DEFAULT_LP=GLPK -DGLPK_ROOT_DIR=$GLPKDIR
cmake -DCMAKE_INSTALL_PREFIX=$LEMONDIR
make install
#make check
#make test
#==========================================|==========================================
#cd $DIR/lab4
#make
#==========================================|==========================================
exit
