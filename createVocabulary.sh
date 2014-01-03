if [ $# -ne 2 ]; then
  echo "Usage: $0 <frequency> <input_file>"
  exit
fi

cat $2 | awk -v freq=$1 '{
  if ($2 > freq)
    print $1;
}'
