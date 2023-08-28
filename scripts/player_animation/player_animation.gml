function animate_player() {
	var is_up = (mouse_direction >= 45) and (mouse_direction <= 135)
	var is_left = (mouse_direction >= 135) and (mouse_direction <= 225)
	var is_down = (mouse_direction >= 225) and (mouse_direction <= 315)
	var is_right = (mouse_direction >= 315) or (mouse_direction <= 45)
	if (inputs.walk == true) {
		if (is_up) { sprite_index = spr_player_walk_up } 
		else if (is_left) { sprite_index = spr_player_walk_left }
		else if (is_down) { sprite_index = spr_player_walk_down }
		else if (is_right) { sprite_index = spr_player_walk_right }
	}
	else {
		if (is_up) { sprite_index = spr_player_idle_up } 
		else if (is_left) { sprite_index = spr_player_idle_left }
		else if (is_down) { sprite_index = spr_player_idle_down }
		else if (is_right) { sprite_index = spr_player_idle_right }
	}
	image_speed = _speed
}