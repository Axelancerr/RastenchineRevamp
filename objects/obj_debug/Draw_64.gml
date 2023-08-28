if (global.debug_enabled == false) { exit }

if (global.debug_options.debug_text == true) { draw_debug_text() }
if (global.debug_options.gui_markers == true) { draw_gui_markers() }

draw_set_font(fnt_game)
bottom_right_text()

var names = ""
var values = ""
var options = struct_get_names(global.debug_options)

for (var i = 0; i < array_length(options); i++) {
	names += $"{options[i]}: \n"
	values += $"{struct_get(global.debug_options, options[i])}\n"
}

draw_text_color(
	GUI_X2, GUI_Y2,
	values,
	c_white, c_white, c_white, c_white,
	1
)
draw_text_color( 
	GUI_X2 - string_width(values), GUI_Y2, 
	names,
	c_white, c_white, c_white, c_white,
	1
)
