
isTouchingTeacup = collision_line(x+4, y-4, x+64, y-4, obj_tea, false, false) > 0;

if (isTouchingTeacup) {
	instLiverPainIndicator.liverPain += .1;
	
	if (instLiverPainIndicator.liverPain > 100) {
		instLiverPainIndicator.liverPain = 100;
	}
} else {
	instLiverPainIndicator.liverPain -= .1;
	
	if (instLiverPainIndicator.liverPain < 0) {
		instLiverPainIndicator.liverPain = 0;
	}
}

liverPainJitter = random_range(0, instLiverPainIndicator.liverPain);

phy_speed_x = (mouse_x - x);
phy_speed_y = (mouse_y - y) + liverPainJitter;
