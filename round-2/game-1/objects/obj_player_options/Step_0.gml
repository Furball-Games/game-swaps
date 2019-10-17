up = keyboard_check(vk_up)
down = keyboard_check(vk_down);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);

x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0])+viewy/5*4;


if(up) answer = up;
if(down) answer = down;
if(left) answer = left;
if(right) answer = right;
