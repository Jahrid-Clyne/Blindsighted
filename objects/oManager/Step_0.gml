bindSpawnLocationsX = [ 500, 600, 700,
500, 700, 800, 900, 1000,
100, 200, 300, 400, 500, 900, 1000,
100, 200, 300, 400, 500, 900, 1000,
600, 700, 800, 900, 1000]
bindSpawnLocationsY = [ 100, 100, 100,
200, 200, 200, 200, 200,
300, 300, 300, 300, 300, 300, 300,
400, 400, 400, 400, 400, 400, 400,
500, 500, 500, 500, 500]
bindSpawnLocationsLength = array_length_1d(bindSpawnLocationsX);

splitSpawnLocationsX = [ 100, 200, 300, 400, 500, 600, 700,	800, 900,
100, 200, 300, 500, 600, 700, 800, 900,
100, 200, 300, 400, 500, 600, 700, 800, 900,
100, 200, 300, 400, 600, 700, 800, 900]
splitSpawnLocationsY = [ 100, 100, 100, 100, 100, 100, 100, 100,100,
200, 200, 200, 200, 200, 200, 200, 200,
300, 300, 300, 300, 300, 300, 300, 300, 300,
400, 400, 400, 400, 400, 400, 400, 400]
splitSpawnLocationsLength = array_length_1d(splitSpawnLocationsX);


havenSpawnLocationsX = [ 100, 200, 300, 400, 500, 600, 700, 800,
100, 200, 300, 400, 500, 700, 800,
100, 400, 800,
100, 200, 300, 400, 500, 700, 800,
100, 200, 300, 500, 600, 700, 800]
havenSpawnLocationsY = [ 100, 100, 100, 100, 100, 100, 100, 100,
200, 200, 200, 200, 200, 200, 200,
300, 300, 300,
400, 400, 400, 400, 400, 400, 400,
500, 500, 500, 500, 500, 500, 500]
havenSpawnLocationsLength = array_length_1d(havenSpawnLocationsX);

switch(currentPhase){
	case phase.init:
		// Add player
			var playerUnit = instance_create_layer(oPlayer.x, oPlayer.y,"Units", oPlayer);
			ds_list_add(global.units, playerUnit);
		
		// Add enemies
		if (room == Bind) { 
			randomLocationIndex = irandom_range(0, bindSpawnLocationsLength-1);
			randomX = bindSpawnLocationsX[randomLocationIndex];
			randomY = bindSpawnLocationsY[randomLocationIndex];
			var enemyUnit = instance_create_layer(randomX, randomY, "Units", oEnemy);
			ds_list_add(global.units, enemyUnit);
		} else if (room == Haven) {
			randomLocationIndex = irandom_range(0, havenSpawnLocationsLength-1);
			randomX = havenSpawnLocationsX[randomLocationIndex];
			randomY = havenSpawnLocationsY[randomLocationIndex];
			var enemyUnit = instance_create_layer(randomX, randomY, "Units", oEnemy);
			ds_list_add(global.units, enemyUnit);
		} else if (room == Split) {
			randomLocationIndex = irandom_range(0, splitSpawnLocationsLength-1);
			randomX = splitSpawnLocationsX[randomLocationIndex];
			randomY = splitSpawnLocationsY[randomLocationIndex];
			var enemyUnit = instance_create_layer(randomX, randomY, "Units", oEnemy);
			ds_list_add(global.units, enemyUnit);
		}
		currentPhase = phase.startTurn;
		while(instance_number(oEnemy)>1){
			instance_destroy(instance_nth_nearest(x,y,oEnemy,2));
		}
	break;
	
	case phase.startTurn:
		if (playerTurnToShoot)
		{
			oEnemyTurn.image_index = 1;
			with(oGun){
				hasShotBullet = false;
			}
			with(oPlayer){
				hasMoved = false;
			}
		} 
		else if(enemyTurnToShoot) //enemy's turn to shoot
		{
			oEnemyTurn.image_index = 0;
			with(oEnemy){
				hasShotBullet=false;
			}
		}
		currentPhase = phase.wait;
	break;
	
	case phase.wait:	// Wait for player or enemy to shoot bullet
		if (oGun.hasShotBullet) {
			currentPhase = phase.process;
		}
		else if(oEnemy.hasShotBullet) {
			currentPhase = phase.process;
		}
	break;
	
	case phase.process:	// Process what happens to 
		// Should occur within playerBullet and enemyBullet
	break;
//	
//	case phase.checkFinish:
//	break;
//	
	case phase.endTurn:
		if(playerTurnToShoot){
			playerTurnToShoot=false;
			enemyTurnToShoot=true;
		}
		else if(enemyTurnToShoot){
			playerTurnToShoot=true;
			enemyTurnToShoot=false;
		}
		currentPhase = phase.startTurn;
	break;
	
	case phase.win:
		//audio_stop_all();

		//audio_play_sound(mVictory, 1000, true);
	break;
	
	case phase.lose:
		//audio_stop_all();

		//audio_play_sound(mDefeat, 1000, true);
	break;

	
}
