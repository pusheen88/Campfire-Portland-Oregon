var xvel = 0;
var yvel = 0;

var ox = x;
var oy = y;

if (on_ground && AnyKeyPressed(global.key_move_up)) {
    jump_time = current_time;
}

var jump_end = jump_time + jump_duration;

yvel += AnyKeyPressed(global.key_move_down) ? move_speed : 0;
xvel -= AnyKeyPressed(global.key_move_left) ? move_speed : 0;
xvel += AnyKeyPressed(global.key_move_right) ? move_speed : 0;

if (xvel != 0 && yvel != 0) {
    xvel = sqrt(move_speed);
    yvel = sqrt(move_speed);
}

if (current_time < jump_end && AnyKeyPressed(global.key_move_up)) {
    yvel -= move_speed;
} else {
    if (!on_ground) yvel += grav_speed;
}

move_and_collide(xvel, yvel, [Solid]);

if (x == ox && y == oy) {
    on_ground = true;
} else {
    on_ground = false;
}
