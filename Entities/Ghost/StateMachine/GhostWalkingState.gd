extends State
class_name GhostWalkingState

@onready var ghost: CharacterBody2D = $"../.."

func enter():
	if ghost.animation_player:
		update_animation(ghost.playback[ghost.playback_index])

func update(_delta: float):
	pass

func physics_update(_delta: float):
	handle_movement()

func handle_movement():
	pass
	

func update_animation(direction: Vector2):
	direction = direction.round()
	ghost.last_direction = direction
	
	ghost.animation_player.speed_scale = 0.55
	
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
	
	ghost.animation_player.play(animation_map[direction])
