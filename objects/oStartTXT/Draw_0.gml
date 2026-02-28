// Draw background
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// Draw title
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width / 2, room_height / 2 - 60, "Under Preasure"); // replace with your game title

// Draw prompt
draw_text(room_width / 2, room_height / 2 + 20, "Press ENTER or SPACE to Start");