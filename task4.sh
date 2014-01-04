TRAINING="training_full.txt"
TEST="test.txt"
MODELS="europarl.modelos"

for freq in 0 1 5 9; do
  rm task4-$freq.dat
  for ord in $(seq 3 4); do
    echo -n "$ord " >> task4-$freq.dat
    ./createVocabulary.sh $freq training_full_voca_freq.txt > training_full_voca.txt
    ngram-count -order $ord -lm $MODELS/modelo-$ord-$freq -vocab training_full_voca.txt -text $TRAINING 2> /dev/null
    ngram -order $ord -lm $MODELS/modelo-$ord-$freq -ppl $TEST | grep "ppl" | awk '{print $6}' >> task4-$freq.dat
  done
done
