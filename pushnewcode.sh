#!/bin/bash
# Author: 刘阳
#   Date: 2021-06-02
#   Desc: 便捷推送文件到gitee仓库

function runstatus(){
    if [ $? -eq 0 ]
        then
            echo "\033[1;32mSUCCESS\033[0m"
    else
            echo "\033[1;31mFAILED\033[0m"
            exit 1
    fi
}


function pushgitee(){
    # 添加文件，默认添加所有文件
    echo "\033[1;36m添加上传文件\033[0m"
    git add . 
    echo -n "\033[1;36m添加上传文件:\033[0m"
    runstatus
    echo

    # 填写提交commit
    echo "\033[1;36m添加提交commit\033[0m"
    git commit -m "$*" 
    echo "\033[1;36m添加提交commit:\033[0m"
    runstatus
    echo

    # 推送到远程
    echo "\033[1;36m推送到远程\033[0m"
    git push origin master
    echo "\033[1;36m推送到远程:\033[0m"
    runstatus
    echo
}

function main(){
    if [ $# -gt 0 ]
    then
        pushgitee $*
    else
        echo "USAGE: $0 'commit message'"
        echo "example: sh $0 'first subimt'"
    fi
}

main $*
