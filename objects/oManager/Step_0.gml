switch(currentPhase){
	case phase.init:
		// Add players
		//for(var i = 0; i <= instance_number(oPlayer); i++){
			//var playerSpawner = instance_find(oPlayer, i);
			var playerUnit = instance_create_layer(oPlayer.x, oPlayer.y,"Units", oPlayer);
			ds_list_add(global.units, playerUnit);
		//}
		
		// Add enemies
		//for(var i = 0; i <= instance_number(oEnemy); i++){
			//var enemySpawner = instance_find(oEnemy, i);
			var enemyUnit = instance_create_layer(oEnemy.x, oEnemy.y,"Units", oEnemy);
			ds_list_add(global.units, enemyUnit);
		//}
		currentPhase = phase.startTurn;
	break;
	
	case phase.startTurn:
		if (playerTurnToShoot)
		{
			with(oGun){
				hasShotBullet = false;
			}
			with(oPlayer){
				hasMoved = false;
			}
		} else //enemy's turn to shoot
		{
		}
		currentPhase = phase.wait;
	break;
	
	case phase.wait:	// Wait for player or enemy to shoot bullet
		if (oGun.hasShotBullet) {
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
		playerTurnToShoot = !playerTurnToShoot;
		currentPhase = phase.startTurn;
	break;
	
	case phase.win:
	break;
	
	case phase.lose:
	break;

	
}