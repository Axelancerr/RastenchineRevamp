fullscreen = window_get_fullscreen()
max_scale = floor(display_width() / 640)

if (fullscreen == true) {
	if (keyboard_check_pressed(global.TOGGLE_FULLSCREEN_KEY) == true) {
		window_set_fullscreen(false)
		exit
	}
	scale = max_scale
	window_set_size(display_width(), display_height())
}
else if (fullscreen == false) {
	if (keyboard_check_pressed(global.TOGGLE_FULLSCREEN_KEY) == true) {
		window_set_fullscreen(true)
		exit
	}
	if (keyboard_check_pressed(global.CYCLE_SCALE_KEY) == true) {
		scale = (((scale - 1) + 1) % max_scale) + 1
	}
	window_set_size(640 * scale, 360 * scale)
}

surface_resize(
	application_surface, 
	640 * scale, 
	360 * scale
)