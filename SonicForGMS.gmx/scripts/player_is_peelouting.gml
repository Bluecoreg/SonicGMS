// player_is_peelouting(step)

var phase = argument0;

switch (phase) {
case "start":
    game_pc_animate(self, "pealoutcharge");
    timeline_speed = 0.5;
    image_angle = gravity_direction;

    game_pc_camera_direct(self, game_pc_camera_state_normal);
    game_pc_play_sound(self, PealOutChargeSound);
    break;

case "step":
    game_pc_move_on_ground(self);
    if (state_changed) {
        pealoutcharge_time = 0;
        return false;
    }

    if (not on_the_ground or (local_direction >= 90 and local_direction <= 270)) {
        pealoutcharge_time = 0;
        return game_pc_perform(self, player_is_falling);
    }

    if (mask_direction != gravity_direction) {
        control_lock_time = default_slide_lock_time;
        pealoutcharge_time = 0;
        return game_pc_perform(self, player_is_running);
    }

    if (not input_up and pealoutcharge_time >= 30) {
        x_speed = (facing_sign * 12);
        
        with (camera) {
            freeze_time = floor(24 - abs(other.x_speed));
        }

        game_pc_play_sound(self, PealOutSound);

        pealoutcharge_time = 0;
        return game_pc_perform(self, player_is_running);
    }
    else if (not input_up)
    {
      pealoutcharge_time = 0;
      return game_pc_perform(self, player_is_standing);
    }
    
    pealoutcharge_time += 1;
    break;
}
