if(place_meeting(x,y,obj_player)){
	if(!instance_exists(obj_text_buble) || distance_to_object(obj_text_buble) > 100){
		instance_create_layer(x,y,layer,obj_text_buble);
		instance_create_layer(x,y,layer,obj_player_options);
		with(obj_text_buble){
			text = other.stringOtext
			//delta_time
		}
		with(obj_player_options){
			OP1 = other.Option1;
			OP2 = other.Option2;
			OP3 = other.Option3;
			OP4 = other.Option4;
			
			if(answer == up) instance_destroy();
		}
	}
}