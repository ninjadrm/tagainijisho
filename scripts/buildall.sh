#!/bin/sh
# Build all that is possible to build under Linux (source tarball + databases + win32 binaries)
VERSION=`grep "set(VERSION " CMakeLists.txt |sed -n 's/set(VERSION \(.*\))$/\1/p'`

rm -Rf releasefiles
mkdir releasefiles
sh scripts/buildsourcerelease.sh
tar xfz tagainijisho-$VERSION.tar.gz
cd tagainijisho-$VERSION
sh scripts/buildalldatabases.sh
sh scripts/buildwin32releases.sh
mv *.db tagainijisho-*.exe ../releasefiles
cd ..
mv tagainijisho-$VERSION.tar.gz releasefiles
rm -Rf tagainijisho-$VERSION
