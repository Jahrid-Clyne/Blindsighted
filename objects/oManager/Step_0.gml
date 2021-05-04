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
		with(oGun)
		{
			state = phase.startTurn;
			
		}
		currentPhase = phase.wait;
	break;
	
	case phase.wait:
		currentPhase = phase.process;
	break;
	
	case phase.process:
		currentPhase = phase.checkFinish;
	break;
	
	case phase.checkFinish:
	break;
	
	case phase.endTurn:
		currentPhase = phase.startTurn;
	break;
	
	case phase.win:
	break;
	
	case phase.lose:
	break;

	
}