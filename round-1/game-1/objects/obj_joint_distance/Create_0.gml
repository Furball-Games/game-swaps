//circle = instance_create_layer(x,y,layer,obj_circle);
//triangle = instance_create_layer(x,y,layer,obj_triangle);

//physics_joint_distance_create(circle, triangle, circle.x, circle.y, triangle.x, triangle.y, false);

physics_joint_distance_create(obj_circle, obj_triangle, obj_circle.x, obj_circle.y, obj_triangle.x, obj_triangle.y, false);
physics_joint_distance_create(obj_circle, obj_square, obj_circle.x, obj_circle.y, obj_square.x, obj_square.y, false);