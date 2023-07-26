#!/bin/bash

# 失敗したテストの追跡
fail=0

# 正常な動作の確認
echo "正常な動作のテスト:"
echo "2と4の最大公約数:"
./gcd.sh 2 4
if [ $? -eq 0 ]; then
    echo "テスト成功"
else
    echo "テスト失敗"
    fail=1
fi
echo ""

echo "15と25の最大公約数:"
./gcd.sh 15 25
if [ $? -eq 0 ]; then
    echo "テスト成功"
else
    echo "テスト失敗"
    fail=1
fi
echo ""

# エラーハンドリングの確認
echo "エラーハンドリングのテスト:"
echo "引数が1つだけの場合:"
./gcd.sh 15
if [ $? -ne 0 ]; then
    echo "テスト成功"
else
    echo "テスト失敗"
    fail=1
fi
echo ""

echo "引数が自然数でない場合（小数）:"
./gcd.sh 2.5 8
if [ $? -ne 0 ]; then
    echo "テスト成功"
else
    echo "テスト失敗"
    fail=1
fi
echo ""

echo "引数が自然数でない場合（負の数）:"
./gcd.sh -2 8
if [ $? -ne 0 ]; then
    echo "テスト成功"
else
    echo "テスト失敗"
    fail=1
fi
echo ""

echo "引数が自然数でない場合（文字列）:"
./gcd.sh "two" 8
if [ $? -ne 0 ]; then
    echo "テスト成功"
else
    echo "テスト失敗"
    fail=1
fi
echo ""

echo "引数が0の場合:"
./gcd.sh 0 8
if [ $? -ne 0 ]; then
    echo "テスト成功"
else
    echo "テスト失敗"
    fail=1
fi
echo ""

echo "引数が1場合:"
./gcd.sh 1 8
if [ $? -eq 0 ]; then
    echo "テスト成功"
else
    echo "テスト失敗"
    fail=1
fi
echo ""

# テストがすべて成功したかどうかをチェック
if [ $fail -eq 0 ]; then
    echo "全てのテストが成功しました。"
    exit 0
else
    echo "一部のテストが失敗しました。"
    exit 1
fi

