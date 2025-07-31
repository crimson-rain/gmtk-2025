extends State
class_name GhostIdleState

@onready var ghost: CharacterBody2D = $"../.."

func enter():
	if ghost.animation_player:
		update_animation()

func update(_delta: float):
	pass

func physics_update(_delta: float):
	handle_movement()

func handle_movement():
	pass
	

func update_animation():
	ghost.animation_player.speed_scale = 0.45
	
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
	
	# TODO: Complete and replace this to use last faced
	ghost.animation_player.play("idle_up")
