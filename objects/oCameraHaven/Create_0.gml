camera = camera_create();
WIDTH = 896;
HEIGHT = 576;
SWIDTH = 1024
w = SWIDTH;
h = HEIGHT;
x = WIDTH/2;
y = HEIGHT/2;
xCenter = x;
yCenter = y;

var vm = matrix_build_lookat(x,y,-10, x,y,0, 0, 1, 0);
var pm = matrix_build_projection_ortho(w, h, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

follow = oPlayer;
xTo = xCenter;
yTo = yCenter;
wTo = w;
hTo = h;
