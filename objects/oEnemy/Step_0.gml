time_delay-=1;
//var otherEnemy= instance_nth_nearest(x,y,oEnemy,2)
/*if(otherEnemy!=noone && otherEnemy!=instance_id){
	instance_destroy(otherEnemy);
} */
if (oManager.enemyTurnToShoot && !hasShotBullet && time_delay<0) {
	oEnemy.x = oEnemy.x + random_range(-10,10);
	var directionToShoot = point_direction(x,y, oPlayer.x, oPlayer.y);
	var bullet = instance_create_layer(x,y,"Bullets", oEnemyBullet); //Creates a bullet instance
		with (bullet)
		{
			speed = 4;	//Set speed of bullet
			direction = directionToShoot; //Gets angle of the gun
			image_angle = direction-other.firingRange+irandom(2*other.firingRange);
			collisionCount =0;
		}
	time_delay=20;
	hasShotBullet=true;
}
