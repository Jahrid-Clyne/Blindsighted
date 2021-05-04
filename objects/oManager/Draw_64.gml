draw_text(0,0, string(currentPhase));

for (var i = 0; i < ds_list_size(global.units); i++) {
	draw_text(0,16+(i*16), string(global.units[|i]));
}
