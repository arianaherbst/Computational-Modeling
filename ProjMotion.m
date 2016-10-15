%Written by Ariana Herbst on August 31, 2016
function [ range ] = ProjMotion( x0, y0, v0, ang )
    %Given the initial coordinates (x, y), velocity, and angle,
    %plots the motion in the x and y direction and
    %returns the total distance travelled.
    a = v0 * sin(pi * ang / 180);
    g = 9.8;
    timpact = (a + (a^2 + 2*g*y0)^.5)/ g;
    x = []; y = [];
    vx = v0*cos(pi*ang/180);
    for t = 0:.01:timpact
        i = vx * t + x0; j = -.5 * g * t^2 + a * t + y0;
        x = [x, i]; y = [y, j];
    end
    plot(x,y);
    title('Projectile Motion');
    xlabel('X Position');
    ylabel('Y Position');
    range = vx * timpact;
end