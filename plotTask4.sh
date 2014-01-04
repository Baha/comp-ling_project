echo "set xlabel 'Orden de los n-gramas'
      set ylabel 'Perplejidad media del conjunto de prueba'
      set xtics 1
      set xrange [2.8:4.2]
		  set terminal png
		  set output 'plot_task4.png'
		  plot 'task4-0.dat' u 1:2 title 'Voc. con frecuencia > 0' w lp, \
      'task4-1.dat' u 1:2 title 'Voc. con frecuencia > 1' w lp, \
		  'task4-5.dat' u 1:2 title 'Voc. con frecuencia > 5' w lp, \
		  'task4-9.dat' u 1:2 title 'Voc. con frecuencia > 9' w lp" | gnuplot
