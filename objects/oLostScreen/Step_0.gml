// Hack to fix room order
if variable_global_exists("gameJustStarted") {
	if (global.gameJustStarted) {
		global.gameJustStarted = false;
		room_goto(StartingScreen);
	}
} else {
	global.gameJustStarted = false;
}
