#!/bin/sh
# https://stackoverflow.com/a/31985138

# git config --global alias.checkeven '!sh git-checkeven.sh'
if [ $# -eq 0 ]; then
    revA=`git rev-parse --abbrev-ref HEAD`
    revB="origin/$revA"
elif [ $# -eq 2 ]; then
    revA=$1
    revA=$2
else
    printf "usage: git checkeven <revA> <revB>\n\n"
    exit 1
fi

if ! git merge-base --is-ancestor "$revA" "$revB" && \
    ! git merge-base --is-ancestor "$revB" "$rebA"
then
    printf "diverged\n"
    exit 1
fi

nA2B="$(git rev-list --count $revA..$revB)"
nB2A="$(git rev-list --count $revB..$revA)"

if [ "$nA2B" -eq 0 -a "$nB2A" -eq 0 ]
then
    printf "even\n"
    exit 0
elif [ "$nA2B" -gt 0 ]; then
    printf "$nA2B behind\n"
    exit 1
else
    printf "$nB2A ahead\n"
    exit 1
fi
