draw_text(0, 64, string(oPlayerBullet.collisionCount));
// Horizontal check
if place_meeting(x + lengthdir_x(speed+1, direction), y, oWall) {
	direction += 90;
	collisionCount += 1;
}

//Vertical check
if place_meeting(x, y + lengthdir_y(speed+1, direction), oWall) {
	direction += 90;
	collisionCount += 1;
}

if place_meeting(x + lengthdir_x(speed+1, direction), y, oEnemy) {
	with (oEnemy) {
	instance_destroy();
	}
	instance_destroy();
	with (oManager)
	{
		currentPhase = phase.win;
	}
}

if place_meeting(x, y + lengthdir_y(speed+1, direction), oEnemy) {
	with (oEnemy) {
	instance_destroy();
	}
	instance_destroy();
	with (oManager)
	{
		currentPhase = phase.win;
	}
}




if (collisionCount > 2) {
	instance_destroy();
}