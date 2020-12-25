#!/bin/bash

export PS4='+ ' # make Travis/Github closer; this is used by set -x

exec 2>&1       # Actions seems to not be great about syncronizing the output from stderr and stdout; travis is
                # hopefully forcing both to stdout will make the output consistent

# generate an infinite list (cribbed from https://docs.python.org/3/library/itertools.html#itertools.count)
count() {
  set +x
  set -e # quit on error; important for e.g. quitting when stdout is closed
  
  i=0
  while true; do
    i=$(($i + 1))
    echo $i
  done 
}

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
count | while read i; do
  echo $i;
  if [ $i -gt 7 ]; then
    break;
  fi
done
echo "Great, I see you're finished."
