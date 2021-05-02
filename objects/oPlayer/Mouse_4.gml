var bullet = instance_create_layer(x,y, "Instances", oPlayerBullet)
	bullet.direction= point_direction(x,y,mouse.x,mouse.y)