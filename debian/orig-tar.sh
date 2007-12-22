#!/bin/sh -e

# $1 = version
TAR=../libcodemodel-java_$1.orig.tar.gz
DIR=libcodemodel-java-$1.orig
#EXTRA_ARGS=--username xxx

# clean up the upstream tarball
svn export https://codemodel.dev.java.net/svn/codemodel/tags/codemodel-$1/ \
    $DIR $EXTRA_ARGS
GZIP=--best tar -c -z -f $TAR $DIR
rm -rf $DIR

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi
