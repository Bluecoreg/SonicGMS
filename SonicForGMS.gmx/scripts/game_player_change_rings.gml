/// game_player_change_rings(player, amount)

var player = argument0;
var amount = argument1;

with (player) {
    var count = rings;
    game_player_set_rings(self, rings + amount);
    if (sign(amount) > 0) {
        if (rings != count and RINGS_PER_LIFE > 0 and
            lives_via_rings < MAX_LIVES_VIA_RINGS) {
            var previous_lives_total = count div RINGS_PER_LIFE;
            var lives_total = min(rings div RINGS_PER_LIFE, RINGS_PER_LIFE * MAX_LIVES_VIA_RINGS);
            if (lives_total > previous_lives_total and lives_total > lives_via_rings) {
                game_player_change_lives(self, lives_total - previous_lives_total);
                if (lives_via_rings < lives_total) {
                    lives_via_rings = lives_total;
                }
            }
        }

        // play chime
        with (character) {
            game_pc_play_sound(self, ring_soundid);
            if (ring_soundid == RingRightSound) {
                ring_soundid = RingLeftSound;
            } else {
                ring_soundid = RingRightSound;
            }
        }
    }
}
