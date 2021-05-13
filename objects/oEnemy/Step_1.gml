//var otherEnemy= instance_nth_nearest(x,y,oEnemy,2)
/*if(otherEnemy!=noone && otherEnemy!=instance_id){
	instance_destroy(otherEnemy);
} */

// Decrement timer on enemy turn
if (oManager.enemyTurnToShoot && !hasShotBullet && time_delay>0) {
	time_delay-=1;
}

// Shoot when timer == 0
else if (oManager.enemyTurnToShoot && !hasShotBullet && time_delay<=0) {
	time_delay = DELAY;
	hasShotBullet=true;
	var directionToShoot = point_direction(x,y, oPlayer.x, oPlayer.y);
	directionToShoot=directionToShoot-firingRange+irandom(2*other.firingRange);
	var bullet = instance_create_layer(x,y,"Bullets", oEnemyBullet); //Creates a bullet instance
		with (bullet)
		{
			speed = 4;	//Set speed of bullet
			direction = directionToShoot; //Gets approx line of sight to enemy
			image_angle = direction;
			collisionCount =0;
		}
}
