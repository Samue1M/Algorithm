
%-------------------------------------------------------------------% testando um bagulho aqui
func1 = @(x,y) y*log(x+1); % Primeira EDO
func2 = @(x,y) y*(x**2 -1); % Segunda EDO
func3 = @(x,y) 1-(y/x); % Terceira EDO

  x0 = 0;
  y0 = 1;
  h = 0.1;
  n = 10;
  x0_c = 1;
  y0_c = 1;
  xx = 0:0.1:1;
  xx3 = 1:0.1:2;
  
fprintf('questao A')
fprintf('%10s | %10s | %10s | %10s | %10s | %10s | %10s \n', 'X','Euler', 'Euler Mel.', 'Euler Mod.', 'Fehlb12', 'Fehlb45', 'ODE45 fixo', 'ODE45 Adaptativo');
fprintf('-------------------------------------------------------------------------------------------------------\n');

for i=1:length(xx)
  [X, Y_a] = Euler(func1, x0, y0, h, n );
  [X, A_a] = EulerMelhorado(func1, x0, y0, h, n );
  [X, B_a] = EulerModificado(func1, x0, y0, h, n );
  [X, C_a] = Fehlberg12(func1, x0, y0, h, n );
  [X, D_a] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
  passofixo = false;
  [X, F_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
	fprintf('%10.6f | %10.6f | %10.6f | %10.6f | %10.6f | %10.6f | %10.6f \n', xx(i), Y_a(i), A_a(i), B_a(i), C_a(i), D_a(i), E_a(i), F_a(i));
  
end

fprintf(' questao B \n \n');

fprintf('%10s | %10s | %10s | %10s | %10s | %10s | %10s \n', 'X','Euler', 'Euler Mel.', 'Euler Mod.', 'Fehlb12', 'Fehlb45', 'ODE45 fixo','ODE45 Adaptativo');
fprintf('-------------------------------------------------------------------------------------------------------\n');

for i=1:length(xx)
  [X, Y_b] = Euler(func2, x0, y0, h, n );
  [X, A_b] = EulerMelhorado(func2, x0, y0, h, n );
  [X, B_b] = EulerModificado(func2, x0, y0, h, n );
  [X, C_b] = Fehlberg12(func2, x0, y0, h, n );
  [X, D_b] = Fehlberg45(func2, x0, y0, h, n );
  passofixo = true;
  [X, E_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
  passofixo = false;
  [X, F_b] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
	fprintf('%10.6f | %10.6f | %10.6f | %10.6f | %10.6f | %10.6f | %10.6f \n', xx(i), Y_a(i), A_a(i), B_a(i), C_a(i), D_a(i), E_a(i), F_b(i));
end

fprintf('questao C \n \n');

fprintf('%10s | %10s | %10s | %10s | %10s | %10s | %10s \n', 'X','Euler', 'Euler Mel.', 'Euler Mod.', 'Fehlb12', 'Fehlb45', 'ODE45 fixo','ODE45 Adaptativo');
fprintf('-------------------------------------------------------------------------------------------------------\n');

for i=1:length(xx3)
  [X, Y_c] = Euler(func3, x0_c, y0, h, n );
  [X, A_c] = EulerMelhorado(func3, x0_c, y0, h, n );
  [X, B_c] = EulerModificado(func3, x0_c, y0, h, n );
  [X, C_c] = Fehlberg12(func3, x0_c, y0, h, n );
  [X, D_c] = Fehlberg45(func3, x0_c, y0, h, n );
  passofixo = true;
  [X, E_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
  passofixo = false;
  [X, F_c] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
	fprintf('%10.6f | %10.6f | %10.6f | %10.6f | %10.6f | %10.6f | %10.6f \n', xx(i), Y_a(i), A_a(i), B_a(i), C_a(i), D_a(i), E_a(i), F_c(i));
end









