state = new SnowState("idle")

_health = PLAYER_HEALTH_DEFAULT
stamina = PLAYER_STAMINA_DEFAULT
_speed = PLAYER_IDLE_SPEED

_x = 0
_y = 0

inputs = get_player_inputs()
move_x_direction = 0
move_y_direction = 0

move_direction = 0
mouse_direction = 0

idle_sprites = [
	spr_player_idle_right,
	spr_player_idle_up,
	spr_player_idle_left,
	spr_player_idle_down,
]
walk_sprites = [
	spr_player_walk_right,
	spr_player_walk_up,
	spr_player_walk_left,
	spr_player_walk_down,
]

area_light = instance_create_layer(_x, _y, layer, obj_area_light) 
flash_light = instance_create_layer(_x, _y, layer, obj_flash_light)

#region States
state.add(
	"idle",
	{
		step: function() {
			stamina = min(PLAYER_STAMINA_MAXIMUM, stamina + PLAYER_IDLE_STAMINA_GAIN_PER_FRAME)
			_speed = lerp(_speed, PLAYER_IDLE_SPEED, LERP_PERCENT)
			state.trigger("walk")
			state.trigger("run")
			state.trigger("dodge")
			state.trigger("exhausted")
		}
	}
)
state.add(
	"walking",
	{
		step: function() {
			stamina = min(PLAYER_STAMINA_MAXIMUM, stamina + PLAYER_WALK_STAMINA_GAIN_PER_FRAME)
			_speed = lerp(_speed, PLAYER_WALK_SPEED, LERP_PERCENT)
			state.trigger("idle")
			state.trigger("run")
			state.trigger("dodge")
			state.trigger("exhausted")
		}
	}
)
state.add(
	"running",
	{
		step: function() {
			stamina = max(PLAYER_STAMINA_MINIMUM, stamina - PLAYER_RUN_STAMINA_COST_PER_FRAME)
			_speed = lerp(_speed, PLAYER_RUN_SPEED, LERP_PERCENT)
			state.trigger("idle")
			state.trigger("walk")
			state.trigger("dodge")
			state.trigger("exhausted")
		}
	}
)
state.add(
	"dodging",
	{
		enter: function() {
			stamina = max(PLAYER_STAMINA_MINIMUM, stamina - PLAYER_DODGE_STAMINA_COST)
			_speed = PLAYER_DODGE_SPEED
		},
		step: function() {
			instance_create_layer(
				x, y, layer, 
				obj_after_image, 
				{ 
					frames_to_live: PLAYER_DODGE_LENGTH_FRAMES, 
					image_alpha: 0.5, 
					sprite_index: sprite_index
				}
			)
			if (state.get_time(false) >= PLAYER_DODGE_LENGTH_FRAMES) { 
				state.trigger("idle")
				state.trigger("walk")
				state.trigger("run")
				state.trigger("exhausted")
			}
		},
	}
)
state.add(
	"exhausted",
	{
		step: function() {
			stamina = min(PLAYER_STAMINA_MAXIMUM, stamina + PLAYER_EXHAUSTED_STAMINA_GAIN_PER_FRAME)
			_speed = lerp(
				_speed, 
				(inputs.walk == true) ? PLAYER_EXHAUSTED_SPEED : PLAYER_IDLE_SPEED, 
				LERP_PERCENT
			)
			if (stamina >= PLAYER_EXHAUSTED_STAMINA_THRESHOLD) {
				state.trigger("idle")
				state.trigger("walk")
				state.trigger("run")
				state.trigger("dodge")
			}
		}
	}
)
#endregion

#region State transitions
state.add_transition(
	"idle",
	["walking", "running", "dodging", "exhausted"],
	"idle",
	function() {
		return (inputs.walk == false)
	}
)
state.add_transition(
	"walk",
	["idle", "running", "dodging", "exhausted"],
	"walking",
	function() {
		return (inputs.walk == true) and (inputs.run == false)
	}
)
state.add_transition(
	"run",
	["idle", "walking", "dodging", "exhausted"],
	"running",
	function() {
		return (inputs.walk == true) and (inputs.run == true)
	}
)
state.add_transition(
	"dodge",
	["idle", "walking", "running", "exhausted"],
	"dodging",
	function() {
		return (inputs.dodge == true)
	}
)
state.add_transition(
	"exhausted",
	["idle", "walking", "running", "dodging",],
	"exhausted",
	function() {
		return (stamina <= 0)
	}
)
#endregion