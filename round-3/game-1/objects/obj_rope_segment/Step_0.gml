if(!place_meeting(x,y,obj_anchor) && created == false && y > obj_anchor.y){
	rope = instance_create_layer(x,y,layer,obj_rope_segment)
	joint = physics_joint_rope_create(self,rope,x,y-55,x,y,5,false);
	created = true;
	phy_fixed_rotation = false;
}
var dist = distance_to_object(obj_anchor)+5;
if(obj_anchor.retract == true){
	if(dist < room_height/2){
		phy_position_x += (obj_anchor.x-x)/(dist/5);
		phy_position_y += (obj_anchor.y-15-y)/(dist/5);
	}
	if(y <= obj_anchor.y || y > obj_deathZONE.y){
		instance_destroy();
	}
}
