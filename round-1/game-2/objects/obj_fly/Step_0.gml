if(hp <= 0){
	obj_level_manager.flycount --;
	instance_create_layer(x,y,layer,obj_landingriple);
	instance_create_layer(x,y,layer,obj_liver);
	instance_destroy();
}