# First need to set up a connection called rai-trial with
#   snow connection add

cat "$1" | tr '\n' ' ' | sed "s/^/'/;s/$/'/" | xargs snow sql -c rai-trial -q
