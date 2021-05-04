if (!oManager.playerTurnToShoot) {
	oEnemy.x = oEnemy.x + random_range(-10,10);
	with (oManager){
		currentPhase = phase.endTurn
	}
}
