/// game_save_update_continues(amount, [index])
/**
 * @description Updates the starting continues on the current save 'slot'
 * @argument {real} amount total continues to add
 * @argument {real} index (Optional) save 'slot' to update
 */

var index = -1;
switch (argument_count) {
case 2: index = argument[1];
default:
    var amount = argument[0];
}

var file = game_save_find(index);
with (file) {
    player_continues = max(player_continues + amount, 0);
}
