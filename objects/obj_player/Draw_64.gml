draw_health_bar()
draw_stamina_bar()

if (global.debug_options.debug_text == true) {
	draw_set_font(fnt_game)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	var history = state.history_get()
	var states = ""
	for (var i = 0; i < array_length(history); i++) {
		states += $"{array_length(history) - i}. {history[i]}\n"
	}
	draw_text(10, 10, states)
}