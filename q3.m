%Questao 3
%func1 = @(x,y) y*log(x+1); % Primeira EDO
%func2 = @(x,y) y*(x**2 -1); % Segunda EDO
%func3 = @(x,y) 1-(y/x); % Terceira EDO
%---------------------a)
clf
fprintf ('\n\nSolução da Questão 3 a): Discretização');
func1 = @(x,y) y*log(x+1); % Primeira EDO
x0 = 0;
y0 = 1;
h = 0.1;
n = 10;
[X1, Y1] = Euler(func1, x0, y0, h, n );
printTabXY( X1, 'X1', Y1, 'y aprox', '%8.3f', 'Euler');
xx = 0:0.1:1;
A = [Y1];   
%---------------------b)
fprintf ('\n\nSolução da Questão 3 b): Discretização');
func2 = @(x,y) y*(x**2 -1); % Segunda EDO
x0 = 0;
y0 = 1;
h = 0.1;
n = 10;
[X2, Y2] = Euler(func2, x0, y0, h, n );
printTabXY( X2, 'X2', Y2, 'y aprox', '%8.3f', 'Euler');
B = [Y2];    
%---------------------c)
fprintf ('\n\nSolução da Questão 3c): Discretização');
func3 = @(x,y) 1-(y/x); % Terceira EDO
x0 = 1;
y0 = 1;
h = 0.1;
n = 10;
[X3, Y3] = Euler(func3, x0, y0, h, n );
printTabXY( X3, 'X3', Y3, 'y aprox', '%8.3f', 'Euler');
xx3 = 1:0.1:2;
C = [Y3];   
%-------------PLOTANDO A DISCRITAZAO DE A) B) e C)
plot(xx,A,'-r','marker','o','markerfacecolor','r', xx,B,'--b','linewidth',2, xx3,C,'--*k');
title('Funcoes a) b) c)','fontsize',20)
axis([0 2 0.4 1.6]);
xlabel('x','fontsize',20);
ylabel('y','fontsize',20);
legend('a)y*log(x+1)','b)y*(x**2 -1)','c)1-(y/x)','location','northeast');
hold on;




