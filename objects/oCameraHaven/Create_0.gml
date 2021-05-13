camera = camera_create();
xCenter = x;
yCenter = y;

var vm = matrix_build_lookat(x,y,-10, x,y,0, 0, 1, 0);
var pm = matrix_build_projection_ortho(900, 580, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

follow = oPlayer;
xTo = xCenter;
yTo = yCenter;