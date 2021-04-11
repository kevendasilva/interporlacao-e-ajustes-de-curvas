function yint = splinear(x, y, xint)
  
  for i = 1:length(x)-1
    if ((xint >= x(i)) && (xint <= x(i+1))) # Verificando em que intervalo está o x interpolado
      yint = ((xint - x(i+1))/(x(i) - x(i+1)))*y(i) + ((xint - x(i))/(x(i+1) - x(i)))*y(i+1);
      break;    
    endif
  endfor

end