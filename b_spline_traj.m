t = 0:0.01:15;

x = [0 4 11 15];
y = [0 2 8 10];

s = spline(x,y,t);

figure
hold on
plot(t,s)
plot(x,y,'ro')

val = spline(x,y,10)