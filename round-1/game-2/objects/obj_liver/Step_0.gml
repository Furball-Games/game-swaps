if(place_meeting(x,y,obj_Player)) fallow = true;
var ofsety = random_range(-range, range);
var ofsetx = random_range(-range, range);

if(fallow == false) choper = false;
if(fallow == true && choper == false){
	phy_speed_x = (obj_Player.x - x + ofsetx)/spd;
	phy_speed_y = (obj_Player.y - y + ofsety)/spd;
}
if(fallow == true && choper == true){
	phy_speed_x = (obj_chop_station.x - x + ofsetx)/spd;
	phy_speed_y = (obj_chop_station.y - y + ofsety)/spd;
}