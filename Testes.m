
fprintf ('\n\nSolução da Questão 4 : Calcule as aproximações da solução analítica, usando os seguintes métodos:\n\n'); 


func1 = @(x,y) y*log(x+1); % Primeira EDO
func2 = @(x,y) y*(x**2 -1); % Segunda EDO
func3 = @(x,y) 1-(y/x); % Terceira EDO 

x01 = 1;
y02 = 2;
x0 = 0;
y0 = 1;
h = 0.1;
n = 10;
f = '%10.6f';

[X, Y] = Fehlberg45(func1, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(4)5')

[X, Y] = Fehlberg45(func2, x0, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(4)5')

[X, Y] = Fehlberg45(func3, x01, y0, h, n );
printTabXY( X, 'X', Y, 'Y', f, 'Fehlberg RK(4)5')