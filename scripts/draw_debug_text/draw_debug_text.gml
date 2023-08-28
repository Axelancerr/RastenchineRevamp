function draw_debug_text() {
	draw_set_font(fnt_game)
	bottom_left_text()

	var names = "Window size: \nGUI size: \nCamera Size: \nView Size: "
	var values = $"{window_width()}x{window_height()}\n" + 
				 $"{gui_width()}x{gui_height()}\n" + 
				 $"{camera_width()}x{camera_height()}\n" + 
				 $"{view_width()}x{view_height()}"
	
	if (instance_exists(obj_player)) {
		names += "\nX: \nY: \nMove Dir: \nMouse Dir: \nSpeed: "
		values += $"\n{obj_player._x}" + 
				  $"\n{obj_player._y}" + 
				  $"\n{obj_player.move_direction}" +
				  $"\n{obj_player.mouse_direction}" +
				  $"\n{obj_player._speed}"
	}

	draw_text_color( 
		GUI_X1, GUI_Y2, 
		names, 
		c_white, c_white, c_white, c_white, 1
	)
	draw_text_color(
		GUI_X1 + string_width(names), GUI_Y2,
		values,
		c_white, c_white, c_white, c_white, 1
	)
}
