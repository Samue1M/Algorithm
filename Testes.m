%%%                                                         AMBIENTE DE TESTES
%%% 
%%% UTILIZA ESSE SCRIPT PARA TESTES, NÃO CRIE OUTROS
%%% PARA MELHOR FLEXBILIDADE CRIEI O SCRIPT test PARA FACILITAR
%%%
%%% FAVOR APAGAR O CODIGO APOS UTILIZAR O SCRIPT

Vac= @(t) abs(18*cos(120*pi*t));
Vc_rms= @(t,v) ifelse(v<=Vac(t)-2, (25*Vac(t)-50.1-25*v)/100e-6, -0.1/(100e-6));
Vct = @(t,v) Vc_rms(t,v);

[t_euler,y_euler] = Euler(Vct,0,16, 1/200000, 10000);
[t_emelhorado,y_emelhorado] = EulerMelhorado(Vct,0,16, 1/200000, 10000);
[t_emodify,y_emodify] = EulerModificado(Vct,0,16, 1/200000, 10000);
[t_f12,y_f12] = Fehlberg12(Vct,0,16, 1/200000, 10000);
[t_f45,y_f45] = Fehlberg45(Vct,0,16, 1/200000, 10000);
passofixo=true;
[t_DPfixo,y_DPfixo] = RungeKutta_Dormand_Prince_ode45(Vct,0,16, 1/200000, 10000, passofixo);
passofixo=false;
[t_DPadpt,y_DPadpt] = RungeKutta_Dormand_Prince_ode45(Vct,0,16, 1/200000, 10000, passofixo);

figure;
plot(t_euler,y_euler,'--ob','markersize',1,  t_emelhorado,y_emelhorado,'--*k','markersize',1,  t_emodify,y_emodify,'-xm','markersize',1,  t_f12,y_f12, '--*b','markersize',1, t_f45,y_f45,'-*m','markersize',1,  t_DPfixo, y_DPfixo,':+c','markersize',1,  t_DPadpt,y_DPadpt,'-vr','markersize',1);                  
legend('Euler','EulerMelhorado','EulerModificado','Fehlberg12','Fehlberg45','DormanPriceODE45FIXO','DormanPriceODE45ADPT','location','northwest');
hold on;
grid on;
