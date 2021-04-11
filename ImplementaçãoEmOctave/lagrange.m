function yint = lagrange(x, y, xint)

  # Produtório para o cálculo das funções de Lagrange
  function p = lagfunc(xis, k, xinterp)
    p = 1;
    for j=1:length(xis)
      if j != k
        p = p*((xinterp-xis(j))/(xis(k) - xis(j)));
      endif
    endfor
  end
  
  yint = 0;

  # Somatório para encontrar o valor de y interpolado
  for i = 1:length(x)
    yint = yint + (y(i)*lagfunc(x, i, xint));
  endfor

end