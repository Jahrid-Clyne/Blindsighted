x = oPlayer.x+3;
y = oPlayer.y-6;

image_angle = point_direction(x,y,mouse_x,mouse_y);
time_delay = time_delay - 1;

if (oManager.playerTurnToShoot && !hasShotBullet) {
	if (mouse_check_button(mb_left) && (time_delay < 0))
	{
		time_delay = 20;
		bullet = instance_create_layer(x,y,"Bullets", oPlayerBullet); //Creates a bullet instance
		with (bullet)
		{
			speed = 4;	//Set speed of bullet
			direction = other.image_angle; //Gets angle of the gun
			image_angle = direction;
			collisionCount =0;
		}
		hasShotBullet = true;
	}
}