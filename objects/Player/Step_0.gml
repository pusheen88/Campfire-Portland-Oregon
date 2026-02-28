var xvel = 0;

var oy = y;

if (keyboard_check_pressed(vk_escape)) {
    room_goto(Title);
}

var jump_key_down = AnyKeyPressed(global.key_move_up);
var jump_just_pressed = jump_key_down && !global.jump_key_prev;
global.jump_key_prev = jump_key_down;

if (jump_just_pressed) {
    if (global.on_ground) {
        global.yvel = -global.jump_force;
        global.jump_multiply_track = 1;
    } else if (global.jump_multiply_track < global.Jump_multiply) {
        global.yvel = -global.jump_force;
        global.jump_multiply_track++;
    }
}

if (AnyKeyPressed(global.key_move_right)) {
    xvel += global.move_speed;
    image_xscale = -1;
} else if (AnyKeyPressed(global.key_move_left)) {
    xvel -= global.move_speed;
    image_xscale = 1;
}

if (!global.on_ground) {
    var grav_mult;

    if (abs(global.yvel) < global.apex_threshold) {
        grav_mult = global.apex_grav_mult;
    } else if (global.yvel > 0) {
        grav_mult = global.fall_grav_mult;
    } else {
        grav_mult = 1.0;
    }

    global.yvel += global.grav_speed * grav_mult;
}

global.yvel = clamp(global.yvel, -global.jump_force, global.yvel_max);

move_and_collide(xvel, global.yvel, [Solid]);

if (y == oy) {
    global.on_ground = true;
    global.yvel = 0;
} else {
    global.on_ground = false;
}

if (global.on_ground) {
    global.jump_multiply_track = 0;
}