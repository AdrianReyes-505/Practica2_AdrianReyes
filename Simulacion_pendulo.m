% Parámetros de la simulación
inicioSimulacion = 0;
finSimulacion = 10;
condicionesIniciales = [0, (35*pi)/180, 0, 0];

% Resolver las ecuaciones diferenciales
[tiempo, estados] = ode45(@DobleP, [inicioSimulacion finSimulacion], condicionesIniciales);

% Crear una figura para las gráficas
figure;

% Graficar el ángulo del primer péndulo
subplot(2,1,1);
plot(tiempo, estados(:,1), 'k-', 'LineWidth', 1.5);
grid on;
title('Ángulo del Primer Péndulo (\theta_1)');
xlabel('Tiempo (s)');
ylabel('Rad');
set(gca, 'FontSize', 12);

% Graficar el ángulo del segundo péndulo
subplot(2,1,2);
plot(tiempo, estados(:,2), 'b-', 'LineWidth', 1.5); % Línea azul continua
grid on;
title('Ángulo del Segundo Péndulo (\theta_2)');
xlabel('Tiempo (s)');
ylabel('Rad');
set(gca, 'FontSize', 12);