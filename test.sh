#!/bin/bash

export PS4='+ ' # make Travis/Github closer; this is used by set -x

exec 2>&1       # Actions seems to not be great about syncronizing the output from stderr and stdout; travis is
                # hopefully forcing both to stdout will make the output consistent

set -x

echo
echo "Context:"
echo "--------"
uname -a
whoami
set

echo
echo "Test:"
echo "-----"
echo "How many times does this run?"
#yes | head -n 7
seq | while read i; do
  echo $i;
  if [ $i -gt 7 ]; then
    break;
  fi
done
echo "Great, I see you're finished."
