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
		str1="$file" #目标java文件相对路径
		str2=${str1}
		substring="src/java" #OA2016
		str1=${str1/"${substring}"/'WebContent/WEB-INF/classes'} #替换成WebContent下的相对路径
		if [ "${str1}" = "${str2}" ];then #OA
			str1=${str1/'src'/'WebContent/WEB-INF/classes'}
		fi
		str1=${str1/'.java'/'.class'} #替换成class后缀
		if [ ! -f '$root/$str1' ]; then #文件存在拷贝文件
			destdir="$dire/${str1%/*}"  #目的目录
			mkdir -p "$destdir"  #创建目录
			cp "$root/$str1" "$dire/$str1" #复制文件
		fi
	fi
done

#剪切Wecontent下的东西到外面
mv /Users/$USER/Desktop/UploadFile/WebContent/* /Users/$USER/Desktop/UploadFile/
rm -rf "/Users/$USER/Desktop/UploadFile/WebContent"


#测试信息
# echo $root >> /Users/$USER/Desktop/a.txt
