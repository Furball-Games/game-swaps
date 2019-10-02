isLeftPressed = keyboard_check(vk_left);
isRightPressed = keyboard_check(vk_right);
isUpPressed = keyboard_check(vk_up);
isDownPressed = keyboard_check(vk_down);

if (isLeftPressed) {
	phy_rotation = phy_rotation - 3;

	if (phy_rotation < 0) {
		phy_rotation = 360 + phy_rotation;
	}
	
//	show_debug_message("Current rotation after left: " + string(phy_rotation));
} else if (isRightPressed) {
	phy_rotation = phy_rotation + 3;
	
	if (phy_rotation > 360) {
		phy_rotation = phy_rotation % 360;
	}
	
//	show_debug_message("Current rotation after right: " + string(phy_rotation));
}

if (isUpPressed) {
	phy_linear_velocity_y -= cos(pi / 180 * phy_rotation);
	phy_linear_velocity_x += sin(pi / 180 * phy_rotation);
}
