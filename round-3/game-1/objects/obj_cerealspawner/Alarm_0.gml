if(x<0){
	cereal = instance_create_layer(x,y,layer,obj_cereal);
	cereal.phy_linear_velocity_x = 200;
}if(x>0){
	cereal = instance_create_layer(x,y,layer,obj_cereal);
	cereal.phy_linear_velocity_x = -200;
}
difficulty /= difficulty/3;