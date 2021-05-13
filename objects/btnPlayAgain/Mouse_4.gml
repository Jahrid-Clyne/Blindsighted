/// Return to last room played
if variable_global_exists("lastRoom") {
	room_goto(global.lastRoom);
}