/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 49EEC499
/// @DnDArgument : "code" "mouseDistance = point_distance(x , y, oMovementPointer.x, oMovementPointer.y);$(13_10)move_towards_point(oMovementPointer.x, oMovementPointer.y, min(4, mouseDistance));"
mouseDistance = point_distance(x , y, oMovementPointer.x, oMovementPointer.y);
move_towards_point(oMovementPointer.x, oMovementPointer.y, min(4, mouseDistance));