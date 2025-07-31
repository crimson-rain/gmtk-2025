extends State
class_name PlayerSneak

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
	
	if movement == Vector2.ZERO:
		Transitioned.emit(self, "idle")
		return
	
	player.velocity = movement * player.SPEED
	update_animation(movement)
	player.move_and_slide()

# We use a animation map to avoid becoming YandereDev
func update_animation(direction: Vector2):
	direction = direction.round()
	player.last_direction = direction
	
	player.animation_player.speed_scale = 0.55
	
	var animation_map = {
		Vector2(0, -1): "sneak_up",
		Vector2(0, 1): "sneak_down",
		Vector2(-1, -1): "sneak_left_up",
		Vector2(1, -1): "sneak_right_up",
		Vector2(-1, 1): "sneak_left_down",
		Vector2(1, 1): "sneak_right_down",
		Vector2(-1, 0): "sneak_left_down",
		Vector2(1, 0): "sneak_right_down"
	}
	
	player.animation_player.play(animation_map[direction])
