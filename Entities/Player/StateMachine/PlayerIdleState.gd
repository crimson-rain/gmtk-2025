extends State
class_name PlayerIdleState

@onready var player: CharacterBody2D = $"../.."

func enter():
	if player.animation_player:
		update_animation()

func update(_delta: float):
	pass

func physics_update(_delta: float):
	handle_movement()

func handle_movement():
	var movement: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var dash: bool = Input.is_action_pressed("dash")
	
	if movement != Vector2.ZERO:
		Transitioned.emit(self, "walking")
		return
	
	if dash == true and player.can_dash == true:
		Transitioned.emit(self, "dash")
		return

# We use a animation map to avoid becoming YandereDev
func update_animation():
	player.animation_player.speed_scale = 0.45
	
	var animation_map = {
		Vector2(0, -1): "idle_up",
		Vector2(0, 1): "idle_down",
		Vector2(-1, -1): "idle_left_up",
		Vector2(1, -1): "idle_right_up",
		Vector2(-1, 1): "idle_left_down",
		Vector2(1, 1): "idle_right_down",
		Vector2(-1, 0): "idle_left_down",
		Vector2(1, 0): "idle_right_down"
	}
	
	var action = GhostData.new(Vector2.ZERO, player.last_direction, "idle")
	player.recorded_actions.append(action)
	player.animation_player.play(animation_map[player.last_direction])

func exit():
	pass
