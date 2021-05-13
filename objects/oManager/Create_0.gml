enum phase{
	init,
	startTurn,
	wait,
	process,
	checkFinish,
	endTurn,
	win,
	lose,
}

enum map{
	haven,
	bind,
	split,
}

audio_stop_all();
audio_play_sound(mBGM, 5, true);
currentPhase = phase.init;
currentMap = map.split;
playerTurnToShoot = true;
enemyTurnToShoot = false;

global.units = ds_list_create();