#!/bin/bash

set -e

appName=$1
appVersion=$2
repoUrl=$3
repoFolder=$4


echo -e "\nUpdating homebrew formula in $repoFolder for $repoUrl"

fileUrl='https://github.com/'$repoUrl'/releases/download/'$appName'-'$appVersion/$appName'_macos_amd64_'$appVersion.tar.gz
export URL_MACOS_AMD64=$fileUrl
echo $fileUrl
fileHash=$(curl -sL "$fileUrl" | shasum -a 256 | awk '{ print $1 }')
export HASH_MACOS_AMD64=$fileHash

echo -e "\n$URL_MACOS_AMD64"
echo "$HASH_MACOS_AMD64"

fileUrl='https://github.com/'$repoUrl'/releases/download/'$appName'-'$appVersion/$appName'_macos_arm64_'$appVersion.tar.gz
export URL_MACOS_ARM64=$fileUrl
fileHash=$(curl -sL "$fileUrl" | shasum -a 256 | awk '{ print $1 }')
export HASH_MACOS_ARM64=$fileHash

echo -e "\n$URL_MACOS_ARM64"
echo "$HASH_MACOS_ARM64"

fileUrl='https://github.com/'$repoUrl'/releases/download/'$appName'-'$appVersion/$appName'_linux_amd64_'$appVersion.tar.gz
export URL_LINUX_AMD64=$fileUrl
fileHash=$(curl -sL "$fileUrl" | shasum -a 256 | awk '{ print $1 }')
export HASH_LINUX_AMD64=$fileHash

echo -e "\n$URL_LINUX_AMD64"
echo "$HASH_LINUX_AMD64"

fileUrl='https://github.com/'$repoUrl'/releases/download/'$appName'-'$appVersion/$appName'_linux_arm64_'$appVersion.tar.gz
export URL_LINUX_ARM64=$fileUrl
fileHash=$(curl -sL "$fileUrl" | shasum -a 256 | awk '{ print $1 }')
export HASH_LINUX_ARM64=$fileHash

echo -e "\n$URL_LINUX_ARM64"
echo "$HASH_LINUX_ARM64"

fileUrl='https://github.com/'$repoUrl'/releases/download/'$appName'-'$appVersion/$appName'_uberjar_'$appVersion.tar.gz
export UBER_JAR=$fileUrl

echo -e "\n$UBER_JAR"

rm "$repoFolder"/"$appName".rb
envsubst < ./"$appName".rb.template >> "$appName".rb

cd "$repoFolder"

git add "$appName".rb

git commit -m "Update to latest version of $appName"

git push

echo -e "\n Homebrew formula updated and pushed to git"

unset URL_MACOS_AMD64
unset URL_MACOS_ARM64
unset URL_LINUX_AMD64
unset URL_LINUX_ARM64
unset UBER_JAR
