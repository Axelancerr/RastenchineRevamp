function move_player() {
	var move_x_distance = lengthdir_x(_speed, move_direction)
	var move_y_distance = lengthdir_y(_speed, move_direction)
	
	if (place_meeting(x + move_x_distance, y, obj_player_collision)) {
		while (not place_meeting(x + sign(move_x_distance), y, obj_player_collision)) {
			x += sign(move_x_distance)
		}
		move_x_distance = 0
	}
	if (place_meeting(x, y + move_y_distance, obj_player_collision)) {
		while (not place_meeting(x, y + sign(move_y_distance), obj_player_collision)) {
			y += sign(move_y_distance)
		}
		move_y_distance = 0
	}
	
	x += move_x_distance
	y += move_y_distance
}