/// game_save_delete(index)

var index = -1;
switch (argument_count) {
case 1: index = argument[0];
}

var file = game_save_find(index);
instance_perform_user_event(file, 4); // delete