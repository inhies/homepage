#!/bin/sh
#
## setup.sh
# This script, part of MarylandMesh's homepage repository, is expressly
# for symlinking configuration files and assuring that the host server
# is usable for hosting the site.
set -e

cd $(dirname "$0")

if [ -z "$CHECKFILE" ]; then
	CHECKFILE=/etc/lighttpd
fi

if [ -z "$CONFFILE" ]; then
	CONFFILE=/etc/lighttpd/lighttpd.conf
fi

echo "Beginning setup."
echo "This script should only be run once, or if it ever updates,"
echo "in which case it will be marked as such."
echo

if [ ! -e "$CHECKFILE" ]; then
	echo "It looks like lighttpd is not installed."
	echo "If it is, define the environment variable CHECKFILE as"
	echo "the location of its install. Currently, it is $CHECKFILE."
	exit 1
fi

if [ -e "$CONFFILE" ]; then
	echo "The configuration file already exists."
	echo "Moving it to $CONFFILE.backup"
	mv "$CONFFILE" "$CONFFILE.backup"
fi

echo "Trying to symlink $CONFFILE to this repository."
ln -s "$CONFFILE" ./lighttpd.conf

echo "Successful!"