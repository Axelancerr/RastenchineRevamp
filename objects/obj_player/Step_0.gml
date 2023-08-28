// Feather disable GM1009

_x = x
_y = y - PLAYER_ORIGIN_OFFSET

inputs = get_player_inputs()

if (inputs.walk == true) and (state.state_is("dodging") == false) {
	move_x_direction = inputs.right - inputs.left
	move_y_direction = inputs.down - inputs.up
	move_direction = point_direction(0, 0, move_x_direction, move_y_direction) 
}
mouse_direction = point_direction(_x, _y, mouse_x, mouse_y)

state.step()
move_player()
animate_player()
