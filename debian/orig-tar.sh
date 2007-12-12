#!/bin/sh -e

# $1 = version
TAR=../libcodemodel-java_$1.orig.tar.gz
DIR=libcodemodel-java-$1.orig
echo -n "Enter username for dev.java.net: "; read USERNAME

# clean up the upstream tarball
svn export https://codemodel.dev.java.net/svn/codemodel/tags/codemodel-$1/ \
    $DIR --username $USERNAME
GZIP=--best tar -c -z -f $TAR $DIR
rm -rf $DIR

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi
