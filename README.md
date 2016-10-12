# Script4SourceTree

Scripts for SourceTree

## Features

- Supports mac and windows devices.
- Can easily output JavaWeb Files used for Incrementally update.

### Usage

Mac:
1. SourceTree -> performance -> self defined action
2. add actions

菜单栏标题       | 目标脚本                                         | 参数
:---------- | :------------------------------------------- | :---------------
GetFileOnly | /Users/yihuineng/SourceTree/script/GetFileOnly.sh | $REPO $SHA $FILE
GetUploadFiles | /Users/yihuineng/SourceTree/script/GetProductFile.sh | $REPO $SHA $FILE
GetUploadFiles | /Users/yihuineng/SourceTree/script/GetProductFile.sh | $REPO $FILE


windows：
1. 安装cygwin，设置windows环境变量Path头部加C:\cygwin64\bin;，运行一次程序。
2. 将script文件夹放到C:\cygwin64\home\
3. 配置sourcetree的自定义动作，指向cmd脚本，添加参数 $REPO $FILE

--------------------------------------------------------------------------------
