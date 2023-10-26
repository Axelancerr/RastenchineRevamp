if (keyboard_check_pressed(global.PAUSE_KEY)) {
	if (global.paused == true) {
		sprite = sprite_delete(sprite)
		instance_activate_all()
		global.paused = false
	}
	else {
		sprite = sprite_create_from_surface(
			application_surface, 
			0, 0, 
			view_width(), view_height(), 
			false, false, 0, 0
		)
		instance_deactivate_all(true)
		global.paused = true
	}
}