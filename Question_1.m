fprintf('Solu��o da Quest�o 1 : Determine a solu�ao anal�tica y(x) de cada PVI. \n\n');

%[f, sol, PVIstr, yx, yxstr] = solveEDO('y*log(x+1)', 0, 1) 
[f, sol, PVIstr] = solveEDO('y*log(x+1)', 0, 1) 

%[f, sol, PVIstr, yx, yxstr] = solveEDO('y*(x**2 -1)', 0, 1) 
[f, sol, PVIstr] = solveEDO('y*(x**2 -1)', 0, 1) 

%[f, sol, PVIstr, yx, yxstr] = solveEDO('1-(y/x)', 0, 1) 
[f, sol, PVIstr] = solveEDO('1-(y/x)', 0, 1) 

