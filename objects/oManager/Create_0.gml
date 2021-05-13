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

audio_stop_all();
audio_play_sound(mBGM, 5, true);
currentPhase = phase.init;
playerTurnToShoot = true;
enemyTurnToShoot = false;

global.units = ds_list_create();