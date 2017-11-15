#!/bin/sh

BUFFETT="Life is like a snowball. The important thing is finding wet snow and a really long hill."

BUFFETT=${BUFFETT/snow/foot}
echo "After first modification:"
echo $BUFFETT

BUFFETT=${BUFFETT/snow/}
echo "After second modification:"
echo $BUFFETT

BUFFETT=${BUFFETT/finding/getting}
echo "After third modification:"
echo $BUFFETT

BUFFETT=${BUFFETT%wet*}
echo "After final cut:"
echo $BUFFETT

exit 0;
