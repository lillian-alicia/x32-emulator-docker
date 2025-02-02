#! /bin/sh

if $X32_IP; then
echo "No ip address supplied, running as default.";
./x32
else
./x32 -i $X32_IP
fi