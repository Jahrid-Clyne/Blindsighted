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


currentPhase = phase.init;
playerTurnToShoot = true;
enemyTurnToShoot = false;

global.units = ds_list_create();