if(!instance_exists(obj_text_buble) || distance_to_object(obj_text_buble) > 10){
	instance_create_layer(x,y,layer,obj_text_buble);
	with(obj_text_buble){
		text = obj_dummy_helper.stringOtext
		//delta_time
	}
	stringOtext = "";
}