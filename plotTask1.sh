echo "set xlabel 'Orden de los n-gramas'
      set ylabel 'Perplejidad media del conjunto de prueba'
      set xtics 1
      set xrange [0.5:5.5]
		  set nokey
		  set terminal postscript enhanced color
		  set output 'plot_task1.ps'
		  plot 'task1.dat' u 1:2 w lp" | gnuplot
