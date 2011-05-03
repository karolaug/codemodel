#!/bin/sh -e

VERSION=$2
TAR=../libcodemodel-java_$VERSION.orig.tar.gz
DIR=libcodemodel-java-$VERSION.orig

# clean up the upstream tarball
svn export https://svn.java.net/svn/codemodel~svn/tags/codemodel-$VERSION/ \
    $DIR 
GZIP=--best tar -c -z -f $TAR --exclude '*.jar' --exclude '*.class' $DIR
rm -rf $DIR

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi
