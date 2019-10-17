enum move_direction { up, down, left, right };

wasRightPressed = keyboard_check_pressed(vk_right);
wasLeftPressed = keyboard_check_pressed(vk_left);
wasDownPressed = keyboard_check_pressed(vk_down);
isT_Pressed = keyboard_check(ord("T"));

if (wasRightPressed) {
	show_debug_message("Yes, right was pressed");
	image_xscale = 1;
	phy_rotation = 0;
	dir = move_direction.left;
} else if (wasLeftPressed) {
	image_xscale = -1;
	phy_rotation = 0;
	dir = move_direction.right;
} else if (wasDownPressed) {
	image_xscale = 1;
	phy_rotation = 90;
	dir = move_direction.up;
}

if (isT_Pressed) {
	sprite_index = spr_head_talking;

	if (dir == move_direction.right && phy_linear_velocity_x < 100) {
		phy_linear_velocity_x += 10;
	} else if (dir == move_direction.left && phy_linear_velocity_x > -100) {
		phy_linear_velocity_x -= 10;
	} else if (dir == move_direction.up && phy_linear_velocity_y > -100) {
		phy_linear_velocity_y -= 10;
	}
} else {
	sprite_index = spr_head;
}
