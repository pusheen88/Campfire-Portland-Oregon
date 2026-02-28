var xvel = 0;
var yvel = 0;

var hits = physics_raycast(x, y, x, y - 16, Solid, true);
var on_ground = array_length(hits) > 0;

if (on_ground) yvel -= AnyKeyPressed(global.key_move_up) ? move_speed : 0;
yvel += AnyKeyPressed(global.key_move_down) ? move_speed : 0;
xvel -= AnyKeyPressed(global.key_move_left) ? move_speed : 0;
xvel += AnyKeyPressed(global.key_move_right) ? move_speed : 0;

if (xvel != 0 && yvel != 0) {
    xvel = sqrt(move_speed);
    yvel = sqrt(move_speed);
}

if (!on_ground) yvel += grav_speed;

move_and_collide(xvel, yvel, [Solid]);
