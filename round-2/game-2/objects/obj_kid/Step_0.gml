isRightPressed = keyboard_check(vk_right);
isLeftPressed = keyboard_check(vk_left);

if (isRightPressed xor isLeftPressed) {
	sprite_index = spr_kid_walking;
	
	if (isRightPressed && phy_linear_velocity_x < 100) {
		image_xscale = 1;
		phy_linear_velocity_x += 10;
	}

	if (isLeftPressed && phy_linear_velocity_x > -100) {
		image_xscale = -1;
		phy_linear_velocity_x -= 10;
	}
} else {
	// phy_linear_velocity_x = 0;
	sprite_index = spr_kid;
}
