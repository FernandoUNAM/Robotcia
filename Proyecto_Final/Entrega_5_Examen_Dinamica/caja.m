function [] = caja(position,scale,color)

a = -pi : pi/2 : pi;                                % Define Corners
ph = pi/4;                                          % Define Angular Orientation (‘Phase’)

x = [cos(a+ph); cos(a+ph)]/cos(ph);
y = [sin(a+ph); sin(a+ph)]/sin(ph);
z = [-ones(size(a)); ones(size(a))];

posx = position(1);
posy = position(2);
posz = position(3);

xabs = (x*scale)+(1*scale); 
yabs = (y*scale)+(1*scale);
zabs = (z*scale)-(1*scale);

surf(posx+xabs,posy+yabs,posz+zabs, 'FaceColor',color);                      % Plot Cube
% hold on
% patch(scale*x', scale*y', scale*z', '#fb0000')                              % Make Cube Appear Solid
% hold off

