left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));

if(left)phy_speed_x = -spd;
if(right)phy_speed_x = spd;
if(!left && !right)phy_speed_x = 0;
if(up && phy_speed_y == 0)phy_speed_y = -jumphight;
if(up && phy_speed_y > 1)phy_speed_y = floatspd;
