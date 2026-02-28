 var xvel = 0;
var yvel = 0;

var oy = y;

if (global.on_ground && AnyKeyPressed(global.key_move_up)) {
    global.jump_time = current_time;
}

var jump_end = global.jump_time + global.jump_duration;

yvel += AnyKeyPressed(global.key_move_down) ? global.move_speed : 0;
xvel -= AnyKeyPressed(global.key_move_left) ? global.move_speed : 0;
xvel += AnyKeyPressed(global.key_move_right) ? global.move_speed : 0;

if (xvel != 0 && yvel != 0) {
    xvel = sqrt(global.move_speed);
    yvel = sqrt(global.move_speed);
}

if (current_time < jump_end) {
    yvel -= global.move_speed;
} else {
    if (!global.on_ground) yvel += global.grav_speed;
}

move_and_collide(xvel, yvel, [Solid]);

if (y == oy) {
    global.on_ground = true;
} else {
    global.on_ground = false;
}
