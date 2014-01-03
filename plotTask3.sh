echo "set xlabel 'Orden de los n-gramas'
      set ylabel 'Perplejidad media del conjunto de prueba'
      set xtics 1
      set xrange [2.8:4.2]
      set yrange [11.2:12.6]
		  set terminal postscript enhanced color
		  set output 'plot_task3.ps'
      plot 'task3-wbdiscount.dat' u 1:2 title 'Witten-Bell backoff' w lp, \
      'task3-kndiscount.dat' u 1:2 title 'Kneser-Ney backoff' w lp, \
      'task3-wbdiscount-interpolate.dat' u 1:2 title 'Witten-Bell interpolated' w lp, \
      'task3-kndiscount-interpolate.dat' u 1:2 title 'Kneser-Ney interpolated' w lp" | gnuplot
