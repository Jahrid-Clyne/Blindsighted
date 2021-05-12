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
			var enemyUnit = instance_create_layer(irandom_range(50,950), irandom_range(50,425),"Units", oEnemy);
			//var enemyUnit = instance_create_layer(irandom_range(50, 1025-50), irandom_range(50, 520-50),"Units", oEnemy);
			ds_list_add(global.units, enemyUnit);
		//}
		currentPhase = phase.startTurn;
		while(instance_number(oEnemy)>1){
			instance_destroy(instance_nth_nearest(x,y,oEnemy,2));
		}
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
		} 
		else if(enemyTurnToShoot) //enemy's turn to shoot
		{
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