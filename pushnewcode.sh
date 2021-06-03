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
    echo "添加文件:"
    git add . > /dev/null 2>&1
    runstatus
    echo

    # 填写提交commit
    echo "填写提交commit:"
    git commit -m "$*" > /dev/null 2>&1
    runstatus
    echo

    # 推送到远程
    echo "推送到远程"
    git push origin master > /dev/null 2>&1
    runstatus
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
