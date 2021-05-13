/// @description Insert description here
// You can write your code in this editor
RoomType[0] = Split; 
RoomType[1] = Haven; 
RoomType[2] = Bind; 

room_goto(RoomType[irandom(array_length_1d(RoomType) - 1)]); 