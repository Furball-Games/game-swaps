image_alpha -= fadespd;
if (image_xscale < size) image_xscale += growspd;
if (image_yscale < size) image_yscale += growspd;
if(image_alpha <= 0) instance_destroy();