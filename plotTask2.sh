echo "set xlabel 'Orden de los n-gramas'
      set ylabel 'Perplejidad media del conjunto de prueba'
      set xtics 1
      set xrange [2.8:4.2]
      set yrange [11.5:13]
		  set terminal png
		  set output 'plot_task2.png'
		  plot 'task2.dat' u 1:2 title 'Good-Turing' w lp, \
      'task2-wbdiscount.dat' u 1:2 title 'Witten-Bell' w lp, \
      'task2-kndiscount.dat' u 1:2 title 'Kneser-Ney' w lp, \
      'task2-ukndiscount.dat' u 1:2 title 'Unmodified Kneser-Ney' w lp, \
      'task2-ndiscount.dat' u 1:2 title 'Ristad' w lp" | gnuplot
