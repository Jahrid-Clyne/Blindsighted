x += (xTo - x)/10;
y += (yTo - y)/10;

if (true){//oManager.playerTurnToShoot) {
	var vm = matrix_build_lookat(xCenter,yCenter,-10, xCenter,yCenter,0, 0, 1, 0);
	var pm = matrix_build_projection_ortho(1025, 520, 1, 10000);
} else {

	if (follow != noone)
	{
		xTo = follow.x;
		yTo = follow.y;
	}

	var vm = matrix_build_lookat(x,y, -10, x, y, 0, 0, 1, 0);
	var pm = matrix_build_projection_ortho(160, 160, 1, 10000);	

}

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
