image_xscale += growspd;
image_yscale += growspd;
image_alpha -= fadespd;

if(image_alpha <= 0){
	instance_destroy();
}