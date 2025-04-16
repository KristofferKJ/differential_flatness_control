x_0 = [0; 0; 0; 0];
y_0 = [0; 0; 0; 0];
z_0 = [10; 0; 0; 0];
psi_0 = [0; 0];

x_T = [10; 0; 0; 0];
y_T = [0; 0; 0; 0];
z_T = [10; 0; 0; 0];
psi_T = [0; 0];

T = 15;

x_alpha = poly7traj(x_0, x_T, T);
y_alpha = poly7traj(y_0, y_T, T);
z_alpha = poly7traj(z_0, z_T, T);
psi_alpha = poly3traj(psi_0, psi_T, T);

t = 0:0.01:15;
path = make_path(t, x_alpha, y_alpha, z_alpha);

hold on 
plot3(path(1,:), path(2,:), path(3,:))
axis equal
grid on
hold off

function out = make_path(sigma, x_alpha, y_alpha, z_alpha)
    out = zeros(3, length(sigma));
    for i = 1:length(sigma)
        out(1,i) = b(sigma(i))' * x_alpha;
        out(2,i) = b(sigma(i))' * y_alpha;
        out(3,i) = b(sigma(i))' * z_alpha;
    end
end

function out = b(sigma)
    out = [1, sigma, sigma^2, sigma^3, sigma^4, sigma^5, sigma^6, sigma^7]';
end