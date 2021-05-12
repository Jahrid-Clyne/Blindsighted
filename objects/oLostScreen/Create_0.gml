/// @description Insert description here
// You can write your code in this editor
if audio_is_playing(mDefeat){
		audio_stop_sound(mDefeat);
}
audio_stop_all();
audio_play_sound(mDefeat, 1000, true);