/// game_pc_arms_collision_solid(character, radius)
// ---------------------------------------------------------------
/*  
**  Finds the first solid intersecting the arms (horizontal
**  sensor) of the player's virtual mask.
**
**  Arguments:
**      character   Real; character instance index
**      radius      Real; distance in pixels to extend the mask
**                  (extends horizontally at BOTH ends)
**
**  Returns:
**      Real; index of whichever instance was found, or noone
*/
// ---------------------------------------------------------------
var character = argument0;
var radius = argument1;
// ---------------------------------------------------------------

var result = noone;

with (character) {
    var total = ds_list_size(local_solids);
    var ind;
    for (var n = 0; n < total; ++n) {
        ind = local_solids[| n];
        if (instance_exists(ind)) {
            if (ind.bottom_solid and game_pc_arms_in_shape(self, ind, radius)) {
                result = ind;
                break;
            }
        }
    }
}

return result;
