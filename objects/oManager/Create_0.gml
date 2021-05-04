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

global.units = ds_list_create();