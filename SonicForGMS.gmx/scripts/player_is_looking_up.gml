// player_is_looking_up(step)

var phase = argument0;

switch (phase) {
case "start":
    game_pc_animate(self, "look_up");
    image_angle = gravity_direction;

    game_pc_camera_direct(self, game_pc_camera_state_looking);

    with (camera) {
        look_time = default_look_time;
    }
    break;

case "finish":
    break;

case "step":
    if (input_action_pressed and object_index == Sonic) {
        x_speed = 0;
        return game_pc_perform(self, player_is_peelouting);
    }
    
    if (input_action_pressed and game_pc_upper_collision_solid(self, y_radius + 5) == noone) {
        game_pc_play_sound(self, JumpSound);
        return game_pc_perform(self, player_is_jumping);
    }

    game_pc_move_on_ground(self);
    if (state_changed) {
        return false;
    }

    if (not on_the_ground or (local_direction >= 90 and local_direction <= 270)) {
        return game_pc_perform(self, player_is_falling);
    }

    if (mask_direction != gravity_direction) {
        control_lock_time = default_slide_lock_time;
        return game_pc_perform(self, player_is_running);
    }

    x_speed -= game_pc_calc_slope_friction(self, slope_friction, land_friction);

    if (horizontal_axis_value != 0 or x_speed != 0) {
        return game_pc_perform(self, player_is_running);
    }

    if (not input_up) {
        return game_pc_perform(self, player_is_standing);
    }
    break;
}
