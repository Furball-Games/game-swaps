if(y > room_height) {
	instScore.drops++;

	instance_destroy();
	room_goto(room0);
}
