#!/bin/sh
P="python /path/to/nodemcu-uploader/nodemcu-uploader.py"
$P upload --verify sha1 -c main.lua
if [ $? -ne 0 ]; then
	echo "Upload failed!"
	exit 1
fi
sleep 0.5
$P upload --verify sha1 init.lua
if [ $? -ne 0 ]; then
	echo "Upload failed!"
	exit 1
fi
echo "Success!"
$P file list
