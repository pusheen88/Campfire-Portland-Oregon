var xvel = 0;

var oy = y;

// Manually detect "just pressed" for jump key
var jump_key_down = AnyKeyPressed(global.key_move_up);
var jump_just_pressed = jump_key_down && !global.jump_key_prev;
global.jump_key_prev = jump_key_down;

// Jump logic: allow jump if on ground OR if double jump is available
if (jump_just_pressed) {
    if (global.on_ground) {
        global.yvel = -global.jump_force;
        global.jump_multiply_track = 1;
    } else if (global.jump_multiply_track < global.Jump_multiply) {
        global.yvel = -global.jump_force;
        global.jump_multiply_track++;
    }
}

xvel -= AnyKeyPressed(global.key_move_left) ? global.move_speed : 0;
xvel += AnyKeyPressed(global.key_move_right) ? global.move_speed : 0;

// Apply gravity with apex and fall scaling
if (!global.on_ground) {
    var grav_mult;

    if (abs(global.yvel) < global.apex_threshold) {
        // Near the apex — slow gravity for hang time
        grav_mult = global.apex_grav_mult;
    } else if (global.yvel > 0) {
        // Falling down — stronger gravity for fast fall
        grav_mult = global.fall_grav_mult;
    } else {
        // Still rising — normal gravity
        grav_mult = 1.0;
    }

    global.yvel += global.grav_speed * grav_mult;
}

// Cap fall speed so player always comes down
global.yvel = clamp(global.yvel, -global.jump_force, global.yvel_max);

move_and_collide(xvel, global.yvel, [Solid]);

if (y == oy) {
    global.on_ground = true;
    global.yvel = 0;
} else {
    global.on_ground = false;
}

// Reset jump track when landing
if (global.on_ground) {
    global.jump_multiply_track = 0;
}