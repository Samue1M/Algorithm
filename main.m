addpath(['../' 'util'], ['../' 'edo']);

fprintf('Solução da Questão 1 : Determine a soluç˜ao analítica y(x) de cada PVI. \n\n');

%[f, sol, PVIstr, yx, yxstr] = solveEDO('y*log(x+1)', 0, 1) 
[f, sol, PVIstr] = solveEDO('y*log(x+1)', 0, 1) 

%[f, sol, PVIstr, yx, yxstr] = solveEDO('y*(x**2 -1)', 0, 1) 
[f, sol, PVIstr] = solveEDO('y*(x**2 -1)', 0, 1) 

%[f, sol, PVIstr, yx, yxstr] = solveEDO('1-(y/x)', 0, 1) 
[f, sol, PVIstr] = solveEDO('1-(y/x)', 0, 1) 



fprintf ('\n\nSolução da Questão 2 : Converta a soluç˜ao em uma funçãao n˜ao-simbólica.\n\n');


[~, ~, ~, yx, yxstr] = solveEDO('y*log(x+1)', 0, 1) 

[~, ~, ~, yx, yxstr] = solveEDO('y*(x**2 -1)', 0, 1) 

[~, ~, ~, yx, yxstr] = solveEDO('1-(y/x)', 0, 1) 



fprintf ('\n\nSolução da Questão 4 : Calcule as aproximações da solução analítica, usando os seguintes métodos:\n\n'); 


%func2 = @(x,y) y*log(x+1); % Primeira EDO
func1 = @(x,y) y*(x**2 -1); % Segunda EDO
%func3 = @(x,y) 1-(y/x); % Terceira EDO 


x0 = 0;
y0 = 1;
h = 0.1;
n = 10;
f = '%8.6f';


[X, Y] = Euler(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler');

[X, Y] = EulerMelhorado(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Melhorado');

[X, Y] = EulerModificado(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Euler Modificado');

[X, Y] = Fehlberg12(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(1)2')

[X, Y] = Fehlberg45(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(4)5')

passofixo = true;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo fixo' );

passofixo = false;
[X, Y] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
printTabXY( X, 'X', Y, 'Y', f, 'Dormand-Prince - Passo adaptativo' );



fprintf ('\n\nSolução da Questão 7 : Mostre uma tabela com os valores de cada método:\n\n');


%func2 = @(x,y) y*log(x+1); % Primeira EDO
%func1 = @(x,y) y*(x**2 -1); % Segunda EDO
%func3 = @(x,y) 1-(y/x); % Terceira EDO 


x0 = 0;
y0 = 1;
h = 0.1;
n = 10;
x = 0:0.1:1;
y = 1:0.1:2;


fprintf('%10s | %10s | %10s | %10s | %10s | %10s | %10s \n', 'X','Euler', 'Euler Mel.', 'Euler Mod.', 'Fehlb12', 'Fehlb45', 'ODE45 fixo');
fprintf('-------------------------------------------------------------------------------------------------------\n');


for i=1:length(x)
  [X, Y] = Euler(func1, x0, y0, h, n );
  [X, A] = EulerMelhorado(func1, x0, y0, h, n );
  [X, B] = EulerModificado(func1, x0, y0, h, n );
  [X, C] = Fehlberg12(func1, x0, y0, h, n );
  [X, D] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
	fprintf('%10.6f | %10.6f | %10.6f | %10.6f | %10.6f | %10.6f | %10.6f \n', x(i), Y(i), A(i), B(i), C(i), D(i), E(i));
end










