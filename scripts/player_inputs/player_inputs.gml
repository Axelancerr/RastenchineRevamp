// Feather disable GM1009

function get_player_inputs() {
	var right_check = keyboard_check(global.MOVE_RIGHT_KEY)
	var left_check = keyboard_check(global.MOVE_LEFT_KEY)
	var down_check = keyboard_check(global.MOVE_DOWN_KEY)
	var up_check = keyboard_check(global.MOVE_UP_KEY)
	return {	
		right: right_check,
		left: left_check,
		down: down_check,
		up: up_check,
		walk: ((right_check - left_check) != 0) or ((down_check - up_check) != 0),
		run: keyboard_check(global.RUN_KEY),
		dodge: keyboard_check_pressed(global.DODGE_KEY)
	}
}