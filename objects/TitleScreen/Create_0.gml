/// @description Insert description here
// You can write your code in this editor
if audio_is_playing(mBGM){
		audio_stop_sound(mBGM);
}
audio_stop_all();
audio_play_sound(mMenu, 1000, true);