var shotSpeed = 150;

isLeftPressed = keyboard_check(vk_left);
isRightPressed = keyboard_check(vk_right);
isUpPressed = keyboard_check(vk_up);
// isDownPressed = keyboard_check(vk_down);
wasSpaceBarPressed = keyboard_check_pressed(vk_space);

if(isLeftPressed || isRightPressed){
	phy_fixed_rotation = true;
}else{
	phy_fixed_rotation = false;
}
if(spinoff == true){
	phy_angular_velocity = 600;
	if(alarm[0] == -1) alarm = 30;
}

if (isLeftPressed) {
	phy_rotation = phy_rotation - 3;

	if (phy_rotation < 0) {
		phy_rotation = 360 + phy_rotation;
	}

} else if (isRightPressed) {
	phy_rotation = phy_rotation + 3;
	
	if (phy_rotation > 360) {
		phy_rotation = phy_rotation % 360;
	}

}

if (isUpPressed) {
	var originOffset = -20;
	phy_linear_velocity_y -= cos(pi / 180 * phy_rotation);
	phy_linear_velocity_x += sin(pi / 180 * phy_rotation);
	
	var originY = y - cos(pi / 180 * phy_rotation) * originOffset;
	var originX = x + sin(pi / 180 * phy_rotation) * originOffset;

	var rippleShot = instance_create_layer(originX, originY, "Instances", obj_RippleMove);
	rippleShot.depth = -1;
	rippleShot.phy_rotation = phy_rotation;
	rippleShot.phy_linear_velocity_y += cos(pi / 180 * phy_rotation) * shotSpeed;
	rippleShot.phy_linear_velocity_x -= sin(pi / 180 * phy_rotation) * shotSpeed;
}

if(!instance_exists(obj_RippleShot)){
	if (wasSpaceBarPressed) {
		var originOffset = 20;
		var originY = y - cos(pi / 180 * phy_rotation) * originOffset;
		var originX = x + sin(pi / 180 * phy_rotation) * originOffset;

		var rippleShot = instance_create_layer(originX, originY, "Instances", obj_RippleShot);
		rippleShot.depth = -1;
		rippleShot.phy_rotation = phy_rotation;
		rippleShot.phy_linear_velocity_y -= cos(pi / 180 * phy_rotation) * shotSpeed;
		rippleShot.phy_linear_velocity_x += sin(pi / 180 * phy_rotation) * shotSpeed;
	}
}