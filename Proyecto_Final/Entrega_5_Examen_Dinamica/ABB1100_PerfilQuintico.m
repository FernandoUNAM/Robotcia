function [X,Y,Z,Alpha,Beta,Gamma,Time] = ABB1100_PerfilQuintico(Path)

% Definición de Parámetros
ABB1100_Parametros;

% Tiempo final de la trayetoria
Intervalo = 1;

% Avance de Arreglo
c = 1;

% Propuesta de Trayectoria _____________________________________________________________________________________________________________________________

Path = Path';

P0 = Path(1:3,1);
P1 = Path(1:3,2);

O0 = Path(4:6,1);
O1 = Path(4:6,2);

Tf = Path(end,2);

% Cálculo del Perfil Quintico __________________________________________________________________________________________________________________________


% Cálculo de Posición en el Tiempo______________________________________________________________________________________________________________________
for t = 0:Intervalo:Tf

   Tiempo(c)= t;

   Rt = P0+(10*(t/Tf)^3-15*(t/Tf)^4+6*(t/Tf)^5)*(P1-P0);

   x(c)=Rt(1);
   y(c)=Rt(2);
   z(c)=Rt(3);
   
   c = c+1;
end

c = 1;

% Cálculo de Velocidad Cartesiana en el Tiempo __________________________________________________________________________________________________________

for t = 0:Intervalo:Tf
   
   Vt=(30*(t^2/Tf^3)-60*(t^3/Tf^4)+30*(t^4/Tf^5))*(P1-P0);

   xp(c) = Vt(1);
   yp(c) = Vt(2);
   zp(c) = Vt(3);
   
   c = c+1;
end

% Reinicialización de Ciclo
c = 1;

% Cálculo de la Aceleración Cartesiana en el Tiempo _____________________________________________________________________________________________________

for t=0:Intervalo:Tf
   
   At=(60*(t/Tf^3)-180*(t^2/Tf^4)+120*(t^3/Tf^5))*(P1-P0);
   
   xpp(c) = At(1);
   ypp(c) = At(2);
   zpp(c) = At(3);
   
   c = c+1;
end

c = 1;

% Cálculo de Orientación en el Tiempo ____________________________________________________________________________________________________________________

for t = 0:Intervalo:Tf

   Rt = O0+(10*(t/Tf)^3-15*(t/Tf)^4+6*(t/Tf)^5)*(O1-O0);
   
   alpha(c) = Rt(1);
   beta(c) = Rt(2);
   gamma(c) = Rt(3);
   
   c = c+1;

end

c = 1;

% Cálculo de Velocidades Angulares en el Tiempo __________________________________________________________________________________________________________

for t = 0:Intervalo:Tf
    
   Vt=(30*(t^2/Tf^3)-60*(t^3/Tf^4)+30*(t^4/Tf^5))*(O1-O0);
   
   alphap(c)=Vt(1);
   betap(c)=Vt(2);
   gammap(c)=Vt(3);
   
   c = c+1;
end

% Reinicialización de Ciclo
c = 1;

% Cálculo de Aceleraciones Angulares en el Tiempo _______________________________________________________________________________________________________
for t=0:Intervalo:Tf
    
   At=(60*(t/Tf^3)-180*(t^2/Tf^4)+120*(t^3/Tf^5))*(O1-O0);
   
   alphapp(c) = At(1);
   betapp(c) = At(2);
   gammapp(c) = At(3);
   
   c = c+1;
end

X = [x;xp;xpp];
Y = [y;yp;ypp];
Z = [z;zp;zpp];

Alpha = [alpha;alphap;alphapp];
Beta = [beta;betap;betapp];
Gamma = [gamma;gammap;gammapp];

Time = Tiempo;