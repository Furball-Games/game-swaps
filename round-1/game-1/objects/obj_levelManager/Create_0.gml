/*
Sspawn = [32,288];
Espawn = [448,384];
Hspawn = [896,320];

shoulder = instance_create_layer(Sspawn[0],Sspawn[1],layer,obj_shoulder);
elbow = instance_create_layer(Espawn[0],Espawn[1],layer,obj_elbow);
hand = instance_create_layer(Hspawn[0],Hspawn[1],layer,obj_hand);


physics_joint_distance_create(elbow, shoulder, elbow.x, elbow.y, shoulder.x, shoulder.y, false);
physics_joint_distance_create(elbow, hand, elbow.x, elbow.y, hand.x, hand.y, false);
*/

physics_joint_distance_create(obj_elbow, obj_shoulder, obj_elbow.x, obj_elbow.y, obj_shoulder.x, obj_shoulder.y, false);
physics_joint_distance_create(obj_elbow, obj_hand, obj_elbow.x, obj_elbow.y, obj_hand.x, obj_hand.y, false);


