// Draw background
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// Draw title
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(room_width / 2, room_height / 2 - 60, "Under Pressure", 6, 6, 0);

// Draw prompt
draw_text_transformed(room_width / 2, room_height / 2 + 50, "Press [ENTER] or [SPACE] to Start", 2, 2, 0);