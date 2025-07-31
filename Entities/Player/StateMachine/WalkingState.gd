extends State
class_name Walking

@onready var player: CharacterBody2D = $"../.."

func enter() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	var movement: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if movement == Vector2.ZERO:
		Transitioned.emit(self, "idle")
		return
	
	player.velocity = movement * player.SPEED
	update_animation(movement)
	player.move_and_slide()
	print(player.position)

func exit() -> void:
	pass

func update_animation(direction: Vector2):
	direction = direction.round()
	player.last_direction = direction
	
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
