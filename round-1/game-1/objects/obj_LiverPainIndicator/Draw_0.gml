draw_set_colour(c_white);
draw_text(x, y, "Liver Pain: ");

// Draw the rectangular outline for the liver pain indicator:
var rectWidth = 100;
var rectHeight = 12;
var rectX_Start = x + 110;
var rectY_Start = y + 5;
var rectX_End = rectX_Start + rectWidth;
var rectY_End = rectY_Start + rectHeight;
draw_rectangle(rectX_Start, rectY_Start, rectX_End, rectY_End, true);

// Fill in the rectangle to match where the pain level is at:
var rectFillWidth = liverPain;
var rectFillX_End = rectX_Start + rectFillWidth;
draw_rectangle(rectX_Start, rectY_Start, rectFillX_End, rectY_End, false);
