if (global.paused == true) and (pause_sprite != undefined) {
	// draw pause sprite
	draw_sprite(pause_sprite, 0, 0, 0)
	// draw darkened background
	draw_set_alpha(0.75)
	draw_rectangle_colour(0, 0, view_width(), view_height(), c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
	// draw paused text
	draw_set_font(fnt_game)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(GUI_MIDDLE_X, GUI_MIDDLE_Y, "PAUSED")
}
