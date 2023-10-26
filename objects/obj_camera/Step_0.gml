x += (follow._x - x) / 25
y += (follow._y - y) / 25

if (global.debug_options.allow_out_of_bounds_camera == false) { 
	x = clamp(x, half_width, room_width - half_width)
	y = clamp(y, half_height, room_height - half_height)
}

camera_set_view_pos(view_camera[0], x - half_width, y - half_height)
