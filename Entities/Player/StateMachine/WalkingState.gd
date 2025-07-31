extends State
class_name PlayerWalk

@onready var player: CharacterBody2D = $"../.."

func enter() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	handle_movement()

func exit() -> void:
	pass

# Handle Movement in this function
func handle_movement() -> void:
	var movement: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var sneak: bool = Input.is_action_pressed("sneak")
	
	if movement != Vector2.ZERO and sneak == true:
		Transitioned.emit(self, "sneak")
		return
	
	if movement == Vector2.ZERO:
		Transitioned.emit(self, "idle")
		return
	
	player.velocity = movement * player.SPEED
	
	var action = GhostData.new(player.velocity)
	player.recorded_actions.append(action)
	
	update_animation(movement)
	player.move_and_slide()

# We use a animation map to avoid becoming YandereDev
func update_animation(direction: Vector2):
	direction = direction.round()
	player.last_direction = direction
	
	player.animation_player.speed_scale = 0.55
	
	var animation_map = {
		Vector2(0, -1): "walk_up",
		Vector2(0, 1): "walk_down",
		Vector2(-1, -1): "walk_left_up",
		Vector2(1, -1): "walk_right_up",
		Vector2(-1, 1): "walk_left_down",
		Vector2(1, 1): "walk_right_down",
		Vector2(-1, 0): "walk_left_down",
		Vector2(1, 0): "walk_right_down"
	}
	
	player.animation_player.play(animation_map[direction])
