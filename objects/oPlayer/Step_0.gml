if ((abs(x - target_x) < 4) && abs(y - target_y) < 4) or // When target has reached their click destination, stop
	(place_meeting(x + lengthdir_x(speed+3, direction), y + lengthdir_y(speed+3, direction), oWall)){ // If target runs into a wall stop	
	speed = 0;
}
var mouseDistance = point_distance(x, y, mouse_x, mouse_y);
if (mouse_check_button(mb_right) && !hasMoved && !oGun.hasShotBullet) {	// If right mouse button is clicked and they haven't moved yet
	target_x = mouse_x;
	target_y = mouse_y;
	move_towards_point(target_x, target_y, min(4, mouseDistance)); // Move to current mouse position
	hasMoved = true;
}

