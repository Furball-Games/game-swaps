up = keyboard_check(vk_up)
down = keyboard_check(vk_down);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);

x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0])+viewy/5*4;

if(up) answer = creator.Option1;
if(down) answer = creator.Option2;
if(left) answer = creator.Option3;
if(right) answer = creator.Option4;

if(up || down || left || right){
	creator.DoAction = true;
	creator.Answer = self.answer;
	instance_destroy();
}