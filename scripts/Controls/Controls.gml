global.key_move_up = [ord("W")];
global.key_move_down = [ord("S")];
global.key_move_left = [ord("A")];
global.key_move_right = [ord("D")];

/// @param {Array<Real>} keys
/// @returns {Bool}
function AnyKeyPressed(keys) {
    return array_any(keys, function(it) {
        return keyboard_check(it);
    });
}

function Controls() {
    
}