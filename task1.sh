TRAINING="dihana.entrenamiento"
TEST="dihana.prueba"
MODELS="dihana.modelos"

rm task1.dat
for ord in $(seq 5); do
  echo -n "$ord " >> task1.dat
  rm results_ppl.tmp
  for k in $(seq 5); do
    ngram-count -order $ord -lm $MODELS/modelo$k -text $TRAINING/$TRAINING$k.txt 2> /dev/null
    ngram -order $ord -lm $MODELS/modelo$k -ppl $TEST/$TEST$k.txt | grep "ppl" | awk '{print $6}' >> results_ppl.tmp
  done
  ./computeAverage.sh results_ppl.tmp >> task1.dat
done
