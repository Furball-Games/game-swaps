xsize -= shrinkspd;
ysize -= shrinkspd;


x += fallingdirection*6
y += 3;
if(xsize <= 0.01 || ysize <= 0.01) instance_destroy();
image_xscale = xsize/2;
image_yscale = ysize/2;