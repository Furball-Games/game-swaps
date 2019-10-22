if(drawn == false){
	letter = letterslist[irandom_range(0,array_length_1d(letterslist)-1)];
	drawn = true;
}
draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_center);
//draw_text(x,y,letter);
draw_text_transformed(x,y,letter,xsize,ysize,0);