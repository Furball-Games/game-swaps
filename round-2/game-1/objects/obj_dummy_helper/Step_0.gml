if(place_meeting(x,y,obj_player)){
	if(!instance_exists(obj_text_buble) || distance_to_object(obj_text_buble) > 100){
		instance_create_layer(x,y,layer,obj_text_buble);
			with(obj_text_buble){
				text = other.stringOtext
				//delta_time
		}
	}
}