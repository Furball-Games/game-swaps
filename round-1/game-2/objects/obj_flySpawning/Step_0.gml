image_alpha += alphaspd;

if(image_xscale > 1) image_xscale -= growspd;
if(image_yscale > 1) image_yscale -= growspd;
else{
	instance_create_layer(x,y,"fly",obj_fly);
	instance_create_layer(x,y,"fly",obj_landingriple);
	instance_destroy();
}