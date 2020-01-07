dist = distance_to_object(obj_anchor);

segment1 = instance_create_layer(x,y,layer,obj_rope_segment)
segment2 = instance_create_layer(x,y+64,layer,obj_rope_segment)
physics_joint_rope_create(self,segment1,segment1.x,segment1.y,segment2.x,segment2.y,5,1);
physics_joint_rope_create(segment1,segment2,segment1.x,segment1.y,segment2.x,segment2.y,5,1);

/*
for(i=1;i<dist/64;i++){
	
}