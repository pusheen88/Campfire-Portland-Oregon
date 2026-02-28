// Detect just pressed for start key
var start_key_down = keyboard_check(vk_enter) || keyboard_check(vk_space);
var start_just_pressed = start_key_down && !start_key_prev;
start_key_prev = start_key_down;

if (start_just_pressed) {
    room_goto(TestingRoom); // replace rm_Game with your actual game room name
}