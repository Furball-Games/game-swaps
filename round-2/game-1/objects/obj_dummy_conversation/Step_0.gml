if(place_meeting(x,y,obj_player)){
	if(DoAction == false){
		if(!instance_exists(obj_text_buble) || distance_to_object(obj_text_buble) > 100){
			obj_player.isMakingAChoice = true;
			obj_player.phy_speed_x = 0;
			obj_player.phy_speed_y = 0;
			
			txtbuble = instance_create_layer(x,y,layer,obj_text_buble);
			//if(instance_exists(obj_player_options)) instance_destroy(obj_player_options);
			instance_create_layer(x,y,layer,obj_player_options);
			with(obj_text_buble){
				text = other.stringOtext
			}
			obj_player_options.creator = id;
			with(obj_player_options){
				OP1 = other.Option1;
				OP2 = other.Option2;
				OP3 = other.Option3;
				OP4 = other.Option4;
				
			}
		}
	}


	if(DoAction == true){
		obj_player.isMakingAChoice = false;
		
		instance_destroy(txtbuble)
		if(!instance_exists(obj_text_buble) || distance_to_object(obj_text_buble) > 100){
			var newTextBubble = instance_create_layer(x, y, layer, obj_text_buble);
			
			show_debug_message("Answer: " + string(Answer));
			show_debug_message("correctAnswer: " + string(correctAnswer));
			
			if (Answer == correctAnswer) {
				newTextBubble.text = "You're right!!!";
			} else {
				room_goto(rm_scolding);
			}
			
			/*
			if(Answer == "up") with(obj_text_buble) text = other.reply1
			if(Answer == "down") with(obj_text_buble) text = other.reply2
			if(Answer == "left") with(obj_text_buble) text = other.reply3
			if(Answer == "right") with(obj_text_buble) text = other.reply4
			*/
		}
	}
}