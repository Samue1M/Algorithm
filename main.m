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


fprintf ('\n\nSolução da Questão 3 : Discretize a vari´avel independente a partir de x0, calcule o valor da fun¸c˜ao anal?tica e desenhe:.\n\n');

%QUESTÃO 3
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
%A) func1 = @(x,y) y*log(x+1); % Primeira EDO
for i=1:length(xx)
  [X, Y_a] = Euler(func1, x0, y0, h, n );
  [X, A_a] = EulerMelhorado(func1, x0, y0, h, n );
  [X, B_a] = EulerModificado(func1, x0, y0, h, n );
  [X, C_a] = Fehlberg12(func1, x0, y0, h, n );
  [X, D_a] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_a, F_adpt_a] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
end
  plot(xx,Y_a,'--*k', xx,A_a,'-r',  xx,B_a,'--b','linewidth',2,  xx,C_a,'--y','linewidth',2,  xx,D_a,'--*d',  xx,E_a,'--g','linewidth',3, X_adpt_a, F_adpt_a,'--*m');
  title('Questao 3 funcao a)','fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45ADPT','location','northwest');
  hold on;
  
%B) func2 = @(x,y) y*(x**2 -1); % Segunda EDO

for i=1:length(xx)
  [X, Y_b] = Euler(func2, x0, y0, h, n );
  [X, A_b] = EulerMelhorado(func2, x0, y0, h, n );
  [X, B_b] = EulerModificado(func2, x0, y0, h, n );
  [X, C_b] = Fehlberg12(func2, x0, y0, h, n );
  [X, D_b] = Fehlberg45(func2, x0, y0, h, n );
  passofixo = true;
  [X, E_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_b, F_adpt_b] = RungeKutta_Dormand_Prince_ode45(func2, x0, y0, h, n, passofixo );
end
  figure
  plot(xx,Y_b,'--*k', xx,A_b,'-r',  xx,B_b,'--b','linewidth',2,  xx,C_b,'--y','linewidth',2,  xx,D_b,'--*d',  xx,E_b,'--g','linewidth',3, X_adpt_b, F_adpt_b,'--*m');
  title('Questao 3 funcao b)','fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
  hold on;


%C) func3 = @(x,y) 1-(y/x); % Terceira EDO

for i=1:length(xx)
  [X, Y_c] = Euler(func3, x0_c, y0, h, n );
  [X, A_c] = EulerMelhorado(func3, x0_c, y0, h, n );
  [X, B_c] = EulerModificado(func3, x0_c, y0, h, n );
  [X, C_c] = Fehlberg12(func3, x0_c, y0, h, n );
  [X, D_c] = Fehlberg45(func3, x0_c, y0, h, n );
  passofixo = true;
  [X, E_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
  passofixo = false;
  [X_adpt_c, F_adpt_c] = RungeKutta_Dormand_Prince_ode45(func3, x0_c, y0, h, n, passofixo );
end
  figure
  plot(xx3,Y_c,'--*k', xx3,A_c,'-r',  xx3,B_c,'--b','linewidth',2,  xx3,C_c,'--y','linewidth',2,  xx3,D_c,'--*d',  xx3,E_c,'--g','linewidth',3, X_adpt_c, F_adpt_c,'--*m');
  title('Questao 3 funcao c)','fontsize',20)
  xlabel('x','fontsize',20);
  ylabel('y','fontsize',20);
  grid on;
  legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45APDT','location','northwest');
  hold on;
  
 %----------FIM QUESTAO 3\\


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

[X, Y, YLow] = Fehlberg12(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(1)2')

[X, Y, YLow] = Fehlberg45(func1, x0, y0, h, n );
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
  [X, C, YLow] = Fehlberg12(func1, x0, y0, h, n );
  [X, D, YLow] = Fehlberg45(func1, x0, y0, h, n );
  passofixo = true;
  [X, E] = RungeKutta_Dormand_Prince_ode45(func1, x0, y0, h, n, passofixo );
	fprintf('%10.6f | %10.6f | %10.6f | %10.6f | %10.6f | %10.6f | %10.6f \n', x(i), Y(i), A(i), B(i), C(i), D(i), E(i));
end










