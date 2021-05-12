// Make sure to destroy ds_list called global.units if it exists to prevent memory leaks
if (ds_exists(global.units, ds_type_list)){
	ds_list_destroy(global.units);
}
if audio_is_playing(mBGM){
	audio_stop_sound(mBGM);
}