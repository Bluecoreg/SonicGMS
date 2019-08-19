/// game_audio_enqueue_music(soundid, [priority], [loops])
/**
 * @description Starts music playback and 'queues' it using an instance of GMSGameMusic; destroying this instance will automatically cause the last 'queued' music to start again
 * @argument {real} soundid sound index
 * @argument {real} priority (optional) channel priority; lower priority sounds may be cut off
 * @argument {boolean} loops (optional) whether or not the music repeats indefinitely
 * @returns {real} instance index of GMSGameMusic
 */

var priority = 0;
var loops = false;
switch (argument_count) {
case 3: var loops = argument[2];
case 2: var priority = argument[1];
default:
    var soundid = argument[0];
}

var music = instance_create(0, 0, GMSGameMusic);
music.soundid = soundid;
music.priority = priority;
music.loops = loops;

with (GameMusic) {
    if (id != music and next == noone) {
        event_user(1);
        next = music;
        music.previous = id;
    }
}

instance_perform_user_event(GameAudioConfiguration, 0);
instance_perform_user_event(music, 0);

return music;
