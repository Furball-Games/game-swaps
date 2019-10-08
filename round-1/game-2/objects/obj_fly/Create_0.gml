spd = random_range(30,40);
rotation = random_range(0,360);
phy_linear_velocity_y += cos(pi / 180 * rotation) * spd;
phy_linear_velocity_x -= sin(pi / 180 * rotation) * spd;
