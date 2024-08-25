function derivadas = DobleP(~, estados)
    % Parámetros del sistema
    masa1 = 0.2;
    longitud1 = 0.3;
    masa2 = 0.1;
    longitud2 = 0.25;
    gravedad = 9.81;
    coeficiente = 0.2;
    
    % Inicialización del vector de derivadas
    derivadas = zeros(4, 1);
    
    % Cálculo de las matrices del sistema
    matrizM = [(masa1 + masa2) * longitud1, masa2 * longitud2 * cos(estados(2) - estados(1));
               longitud1 * cos(estados(2) - estados(1)), longitud2];
    matrizC = [coeficiente, -masa2 * longitud2 * sin(estados(2) - estados(1));
               longitud1 * sin(estados(2) - estados(1)), 0];
    matrizG = [(masa1 + masa2) * gravedad * sin(estados(1));
               gravedad * sin(estados(2))];
    
    % Cálculo de las derivadas usando mldivide
    derivadas(1) = estados(3);
    derivadas(2) = estados(4);
    derivadas(3:4) = matrizM \ (-matrizC * [estados(3); estados(4)] - matrizG);
end