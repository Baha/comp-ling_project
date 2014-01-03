TRAINING="dihana.entrenamiento"
TEST="dihana.prueba"
MODELS="dihana.modelos"

for smooth in "" "-interpolate"; do
  for disc in "-wbdiscount" "-kndiscount"; do
    rm task3$disc$smooth.dat
    for ord in $(seq 3 4); do
      echo -n "$ord " >> task3$disc$smooth.dat
      rm results_ppl.tmp
      for k in $(seq 5); do
        ngram-count -order $ord $disc $smooth -lm $MODELS/modelo$k -text $TRAINING/$TRAINING$k.txt 2> /dev/null
        ngram -order $ord -lm $MODELS/modelo$k -ppl $TEST/$TEST$k.txt | grep "ppl" | awk '{print $6}' >> results_ppl.tmp
      done
      ./computeAverage.sh results_ppl.tmp >> task3$disc$smooth.dat
    done
  done
done
