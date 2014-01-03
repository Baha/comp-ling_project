if [ $# -ne 1 ]; then
  echo "Usage: $0 <input_file>"
  exit
fi

cat $1 | awk 'BEGIN{
  sum = 0.0;
}
{
  sum += $1;
}
END{
  printf("%f\n", sum/NR);
}'
