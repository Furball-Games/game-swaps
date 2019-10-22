letterslist = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","!@#$%"];
drawn = false;
letter = "A";

xsize = irandom_range(1,3);
ysize = irandom_range(1,3);

shrinkspd = 0.03;
if(obj_talking_head.image_angle == 0){
	fallingdirection = obj_talking_head.image_xscale;
}else{
	fallingdirection = 0;
}