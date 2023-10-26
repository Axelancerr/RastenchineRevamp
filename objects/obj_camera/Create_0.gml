follow = obj_player

width = 640
height = 360

half_width = width / 2
half_height = height / 2

view_enabled = true
view_visible[0] = true
view_camera[0] = camera_create_view(x, y, width, height)

view_set_wport(0, width)
view_set_hport(0, height)
