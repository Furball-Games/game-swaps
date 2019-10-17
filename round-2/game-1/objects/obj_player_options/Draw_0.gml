draw_set_color(c_black);
draw_set_alpha(0.4);
draw_roundrect_ext(x-1,y,x+viewx-1,y+viewy/5,15,15,false);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(x+viewx/4,y+viewy/5/4,"'^' "+OP1);
draw_text(x+viewx/4*3,y+viewy/5/4,"'v' "+OP2);
draw_text(x+viewx/4,y+viewy/5/4*3,"'<' "+OP3);
draw_text(x+viewx/4*3,y+viewy/5/4*3,"'>' "+OP4);