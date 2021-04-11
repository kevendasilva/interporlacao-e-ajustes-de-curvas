function fx = regressao(x, y)

  # Tamanho dos vetores 
  n = size(x,2);

  # Somatório dos elementos de x
  function s = sumx(xis)
    s = 0;
    for j = 1:size(xis,2);
      s = s + xis(j);
    endfor
  end

  # Somatório dos elementos de y
  function s = sumy(yps)
    s = 0;
    for j = 1:size(yps,2)
      s = s + yps(j);
    endfor
  end

  # Somatório de x_j*y_j
  function s = sumxy(xis, yps)
    s = 0;
    for j = 1:size(xis,2)
      s = s + xis(j)*yps(j);
    endfor
  end

  # Somatório dos valores ao quadrado de x
  function s = sumxx(xis)
    s = 0;
    for j = 1:size(xis,2)
      s = s + (xis(j))^2;
    endfor
  end

  # Erro global
  function s = erroglobal(xis, yps, aum, azero)
    s = 0;
    for j = 1:size(xis,2)
      s = s + (yps(j) - (aum*xis(j) + azero))^2;
    endfor
  end

  # Encontrando o valor do coeficiente a1
  a1 = (n*sumxy(x,y) - sumx(x)*sum(y))/(n*sumxx(x) - (sumx(x))^2);
  # Encontrando o valor do coeficiente a0
  a0 = (sumxx(x)*sumy(y) - sumxy(x,y)*sumx(x))/(n*sumxx(x) - (sumx(x))^2);

  # Função da reta da regressão
  fx = a1*x + a0;

  printf("Equação da reta: %f*x + %f\n", a1, a0);
  printf("Erro Global: %f\n", erroglobal(x, y, a1, a0));

  # Plotando gráfico do conjunto de pontos e reta da regressão
  plot(x,y, 'r.', 'markersize', 20, x, fx, 'linewidth', 1);
  title('Regresão Linear');
  legend('conjunto de pontos', 'regressão linear');
  xlabel('x'); ylabel('y');

end