draw_text(0, 64, string(oPlayerBullet.collisionCount));

MAX_COLLISIONS = 3;
didCollision = false;

// Collision
if place_meeting(x + lengthdir_x(speed+1, direction), y + lengthdir_y(speed+1, direction), oWall) {
	if place_meeting(x + lengthdir_x(speed+1, direction), y + lengthdir_y(speed+1, direction), oWallHorizontal) {
		direction = 360 - direction;
		didCollision = true;
	}
	if place_meeting(x + lengthdir_x(speed+1, direction), y + lengthdir_y(speed+1, direction), oWallVertical) {
		direction = ((180 - direction) + 360) % 360;
		didCollision = true;
	}
	if place_meeting(x + lengthdir_x(speed+1, direction), y + lengthdir_y(speed+1, direction), oWallDownLeftToUpRight) {
		direction = ((90 - direction) + 360) % 360;
		didCollision = true;
	}
	if place_meeting(x + lengthdir_x(speed+1, direction), y + lengthdir_y(speed+1, direction), oWallUpLeftToDownRight) {
		direction = ((270 - direction) + 360) % 360;
		didCollision = true;
	}
}

if didCollision {
	collisionCount += 1;
	image_angle = direction;
}


/*
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
*/



if (collisionCount > MAX_COLLISIONS) {
	instance_destroy();
	with (oManager)
	{
		currentPhase = phase.endTurn;
	}
}