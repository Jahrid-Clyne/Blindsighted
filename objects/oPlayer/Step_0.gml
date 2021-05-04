mouseDistance = point_distance(x , y, oMovementPointer.x, oMovementPointer.y);
move_towards_point(oMovementPointer.x, oMovementPointer.y, min(4, mouseDistance));