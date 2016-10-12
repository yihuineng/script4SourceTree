#!/bin/sh
umask 0000
#step1 桌面建立新的文件夹UploadFile
dire="/Users/$USER/Desktop/UploadFile"
if [ -d "$dire" ]; then
rm -rf "$dire"
mkdir "$dire"
else
mkdir "$dire"
fi

#step2 拷贝WebContent下的文件直接到目录下，拷贝src下对应的class文件到目录下
root=$1
#遍历处理文件
for i in $@;
do
	file=$i
	filehead=${file%%/*}
	#判断文件是否是WebContent下的直接拷贝
	if [ "${filehead}" = "WebContent" ];then
		destdir="$dire/${file%/*}"  #目的目录
		mkdir -p "$destdir"  #创建目录
		cp "$root/$file" "$dire/$file" #复制文件
	fi
	#判断文件是否是src下的,查找对应的class文件如果有，拷贝到WebContent下
	if [ "${filehead}" = "src" ];then
		destdir="$dire/${file%/*}"  #目的目录
		mkdir -p "$destdir"  #创建目录
		cp "$root/$file" "$dire/$file" #复制文件
	fi
done

#测试信息
# echo $root >> /Users/$USER/Desktop/a.txt
