#!/bin/bash
tambah(){
read -p "-> perlu tambahan gk masbro ? (masukan jika ingin tambahan) = " tambah
if [ ! -z $tambah ];then
echo "$tambah" >> $brute
tambah
fi
}

read -p "-> Enter brutelist = " brute
if [ ! -f $brute ];then
echo "file ${target} tidak ada"
exit
fi
read -p "-> Enter ext = " ext
tambah

for x in `cat $brute`
do
rm -f tmpz
curl -I --silent "$1/${x}.${ext}" >  tmpz
if [ ! -f tmpz ];then
continue
fi
cat  tmpz | grep OK > /dev/null;asdf=$?
if [ $asdf -eq 0 ];then
echo "-> $1/${x}.${ext} : OK" >> log.txt
else
echo "-> $1/${x}.${ext} : NO"
fi
done

