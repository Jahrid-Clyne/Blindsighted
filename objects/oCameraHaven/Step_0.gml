x += (xTo - x)/10;
y += (yTo - y)/10;
w += (wTo - w)/10;
h += (hTo - h)/10;

if (oManager.playerTurnToShoot) {
	xTo = xCenter;
	yTo = yCenter;
	wTo = SWIDTH;
	hTo = HEIGHT;
	
	var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
	var pm = matrix_build_projection_ortho(w, h, 1, 10000);
} else {

	if (follow != noone)
	{
		xTo = follow.x;
		yTo = follow.y;
	}
	wTo = 200;
	hTo = 112;

	var vm = matrix_build_lookat(x,y, -10, x, y, 0, 0, 1, 0);
	var pm = matrix_build_projection_ortho(w, h, 1, 10000);	

}

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
