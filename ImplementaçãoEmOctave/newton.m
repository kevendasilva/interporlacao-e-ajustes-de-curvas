function yint = newton(x, y, xint)

  # Coeficientes
  a = [];
  # O primeiro coeficiente é o valor do primeiro elemento de y
  a(1) = y(1); 

  # Vetor das diferenças divididas
  diferencas = [];

  # Cálculo das diferenças divididas simples
  for i = 1:length(x)-1
    diferencas(i,1) = (y(i+1) - y(i))/(x(i+1) - x(i));
  endfor
  
  # Cálculo das diferenças divididas de ordem 2 em diante
  for j = 2:length(x)-1
    for i = 1:length(x)-j
      diferencas(i,j) = (diferencas(i+1, j-1) - diferencas(i,j-1))/(x(j+i) - x(i));
    endfor
  endfor

  # Cálculo dos demais coeficientes
  for j = 2:length(x)
    a(j) =  diferencas(1,j-1);
  endfor
  
  # Encontrando o valor de yint
  yint = a(1);
  xn = 1;
  for k = 2:length(x)
    xn = xn*(xint - x(k-1));
    yint = yint + (a(k)*xn);
  endfor

end