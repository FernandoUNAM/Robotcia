clear; clc;

I = []; I1 = zeros(9,1);

syms Ixx Ixy Ixz Iyx Iyy Iyz Izx Izy Izz

Is = [Ixx;Ixy;Ixz;Iyx;Iyy;Iyz;Izx;Izy;Izz];

N = 7;

%________________________________________________________________________%

I(1) = 4872.572;
I(2) = 1.807
I(3) = 0.161
I(4) = 1.807
I(5) = 2503.971;
I(6) = -17.413
I(7) = 0.161
I(8) = -17.413
I(9) = 2606.234;
        
%________________________________________________________________________%

for i = 1:9
    I1(i) = InertiaConv(N,Is(i),I(i));
end


function I = InertiaConv(CompNum,Isym,Inertia)
Num = sym(CompNum);
u = symunit;
c = unitConvert(Inertia*u.g*u.mm^2,"SI");
F = separateUnits(c);
I = vpa(F,5);
fprintf("%s%s = %.10f;\n",Isym,Num,F);
end
