#region Width / Height
function window_width() { return window_get_width() }
function window_height() { return window_get_height() }

function gui_width() { return display_get_gui_width() }
function gui_height() { return display_get_gui_height() }

function camera_width() { return camera_get_view_width(view_camera[0]) }
function camera_height() { return camera_get_view_height(view_camera[0]) }

function view_width() { return view_get_wport(0) }
function view_height() { return view_get_hport(0) }
#endregion

#region Text Alignment
function top_left_text() { 
	draw_set_valign(fa_top); draw_set_halign(fa_left) 
}
function top_center_text() { 
	draw_set_valign(fa_top); draw_set_halign(fa_center) 
}
function top_right_text() { 
	draw_set_valign(fa_top); draw_set_halign(fa_right) 
}
function middle_left_text() { 
	draw_set_valign(fa_middle); draw_set_halign(fa_left) 
}
function middle_center_text() { 
	draw_set_valign(fa_middle); draw_set_halign(fa_center) 
}
function middle_right_text() { 
	draw_set_valign(fa_middle); draw_set_halign(fa_right) 
}
function bottom_left_text() { 
	draw_set_valign(fa_bottom); draw_set_halign(fa_left) 
}
function bottom_center_text() { 
	draw_set_valign(fa_bottom); draw_set_halign(fa_center) 
}
function bottom_right_text() { 
	draw_set_valign(fa_bottom); draw_set_halign(fa_right) 
}
#endregion
