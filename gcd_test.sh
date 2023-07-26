#!/bin/bash

# 正常な動作の確認
function test_normal_operation {
    echo "正常な動作のテスト:"
    echo "2と4の最大公約数:"
    ./gcd.sh 2 4
    if [ $? -eq 0 ]; then
        echo "テスト成功"
        exit 0
    else
        echo "テスト失敗"
        exit 1
    fi
}

# エラーハンドリングの確認
function test_error_handling {
    echo "エラーハンドリングのテスト:"
    echo "引数が1つだけの場合:"
    ./gcd.sh 15
    if [ $? -ne 0 ]; then
        echo "テスト成功"
        exit 0
    else
        echo "テスト失敗"
        exit 1
    fi

    echo "引数が自然数でない場合（小数）:"
    ./gcd.sh 2.5 8
    if [ $? -ne 0 ]; then
        echo "テスト成功"
        exit 0
    else
        echo "テスト失敗"
        exit 1
    fi

    echo "引数が自然数でない場合（負の数）:"
    ./gcd.sh -2 8
    if [ $? -ne 0 ]; then
        echo "テスト成功"
        exit 0
    else
        echo "テスト失敗"
        exit 1
    fi

    echo "引数が自然数でない場合（文字列）:"
    ./gcd.sh "two" 8
    if [ $? -ne 0 ]; then
        echo "テスト成功"
        exit 0
    else
        echo "テスト失敗"
        exit 1
    fi

    echo "引数が1以下の場合（0）:"
    ./gcd.sh 0 8
    if [ $? -ne 0 ]; then
        echo "テスト成功"
        exit 0
    else
        echo "テスト失敗"
        exit 1
    fi

    echo "引数が1以下の場合（1）:"
    ./gcd.sh 1 8
    if [ $? -eq 0 ]; then
        echo "テスト成功"
        exit 0
    else
        echo "テスト失敗"
        exit 1
    fi
}

# 各テストを実行
test_normal_operation
test_error_handling

