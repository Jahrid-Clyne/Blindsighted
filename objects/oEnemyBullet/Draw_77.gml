draw_text(0, 64, string(oEnemyBullet.collisionCount));

MAX_BOUNCES = 3;
didCollision = false;

// Collision
if place_meeting(x + lengthdir_x(speed+1, direction), y + lengthdir_y(speed+1, direction), oWall) {
	audio_play_sound(sBounce,4,false);
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



if place_meeting(x + lengthdir_x(speed+1, direction), y, oPlayer) {
	with (oPlayer) {
	instance_destroy();
	}
	instance_destroy();
	with (oManager)
	{
		currentPhase = phase.lose;
		room_goto(LostScreen);
	}
}

if place_meeting(x, y + lengthdir_y(speed+1, direction), oPlayer) {
	with (oPlayer) {
	instance_destroy();
	}
	instance_destroy();
	with (oManager)
	{
		currentPhase = phase.lose;
		room_goto(LostScreen);
	}
}



if (collisionCount > MAX_BOUNCES) {
	instance_destroy();
	with (oManager)
	{
		currentPhase = phase.endTurn;
	}
}