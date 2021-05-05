draw_text(0, 64, string(oPlayerBullet.collisionCount));

MAX_BOUNCES = 2;
didCollision = false;

// Distance to Enemy Feedback
d2e = distance_to_object(oEnemy);
distances = [15, 30, 45, 60, 75, 100, 125, 150, 200, 250];
dsize = array_length_1d(distances);

for (i = 0; i < dsize; i += 1) {
	if d2e <= distances[i] {
		image_index = dsize + 1 - i;
		break;
	}
}

if d2e > distances[dsize - 1] {
	image_index = 1;
}

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
*/

if place_meeting(x + lengthdir_x(speed+1, direction), y, oEnemy) {
	with (oEnemy) {
	instance_destroy();
	}
	instance_destroy();
	with (oManager)
	{
		currentPhase = phase.win;
		room_goto(WinScreen); 
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
		room_goto(WinScreen); 
	}
}




if (collisionCount > MAX_BOUNCES) {
	instance_destroy();
	with (oManager)
	{
		currentPhase = phase.endTurn;
	}
}