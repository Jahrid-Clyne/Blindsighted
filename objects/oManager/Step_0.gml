switch(currentPhase){
	case phase.init:
		for(var i = 0; i < instance_number(oSpawn); i++){
			var spawner = instance_find(oSpawn, i);
			var unit = instance_create_layer(spawner.x, spawner.y,"Enemies", oEnemy);
			ds_list_add(global.units, unit);
		}
		currentPhase = phase.startTurn;
	break;
	
	case phase.startTurn:
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