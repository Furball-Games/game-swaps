enum move_direction { up, down, left, right };

wasRightPressed = keyboard_check(vk_right);
wasLeftPressed = keyboard_check(vk_left);
wasDownPressed = keyboard_check(vk_down);
isT_Pressed = keyboard_check(ord("T"));
//nokeypressed = !keyboard_check_pressed(vk_right)||!keyboard_check_pressed(vk_left)||!keyboard_check_pressed(vk_down);

if(wasDownPressed){
	image_xscale = 1;
	phy_rotation = 90;
}else if(wasRightPressed){
	image_xscale = 1;
	phy_rotation = 0;
}else if(wasLeftPressed){
	image_xscale = -1;
	phy_rotation = 0;
}if(wasRightPressed && wasLeftPressed){
	image_xscale = 1;
	phy_rotation = 90;
}
if(isT_Pressed && image_xscale == 1 && phy_rotation == 0 && phy_linear_velocity_x < 100)phy_linear_velocity_x -= 10;
if(isT_Pressed && image_xscale == -1 && phy_rotation == 0 && phy_linear_velocity_x < 100)phy_linear_velocity_x += 10;
if(isT_Pressed && image_xscale == 1 && phy_rotation == 90 && phy_linear_velocity_y > -100)phy_linear_velocity_y -= 10;
if(isT_Pressed){
	sprite_index = spr_head_talking;
	if(alarm[1] == -1) alarm[1] = 4;
}else{sprite_index = spr_head;}
