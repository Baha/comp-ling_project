TRAINING="dihana.entrenamiento"
TEST="dihana.prueba"
MODELS="dihana.modelos"

for disc in "" "-wbdiscount" "-kndiscount" "-ukndiscount" "-ndiscount"; do
  rm task2$disc.dat
  for ord in $(seq 3 4); do
    echo -n "$ord " >> task2$disc.dat
    rm results_ppl.tmp
    for k in $(seq 5); do
      ngram-count -order $ord $disc -lm $MODELS/modelo$k -text $TRAINING/$TRAINING$k.txt 2> /dev/null
      ngram -order $ord -lm $MODELS/modelo$k -ppl $TEST/$TEST$k.txt | grep "ppl" | awk '{print $6}' >> results_ppl.tmp
    done
    ./computeAverage.sh results_ppl.tmp >> task2$disc.dat
  done
done
