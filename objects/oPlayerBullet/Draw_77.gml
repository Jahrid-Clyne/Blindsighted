if place_meeting(x + lengthdir_x(speed+1, direction), y, oWall){
	direction+=90;
	collisionCount++;
}

if place_meeting(x, y + lengthdir_y(speed+1,direction), oWall){
	direction+=90;
	collisionCount++;
}

if(collisionCount>2){
	instance_destroy();
}