draw_text(0,0, string(currentPhase));

for (var i = 0; i < ds_list_size(global.units); i++) {
	draw_text(0,16+(i*16), string(global.units[|i]));
}


draw_text(0,48, string("Player turn to shoot = "));
draw_text(225, 48, string (oManager.playerTurnToShoot));
draw_text(0,64, string("Has shot bullet = "));
draw_text(175, 64, string (oGun.hasShotBullet));
