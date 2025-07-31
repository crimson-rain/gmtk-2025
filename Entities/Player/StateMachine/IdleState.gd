extends State
class_name Idle

@onready var player: CharacterBody2D = $"../.."

func enter():
	if player.animation_player:
		player.animation_player.play("idle_up")

func update(_delta: float):
	pass

func physics_update(_delta: float):
	var movement: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if movement != Vector2.ZERO:
		Transitioned.emit(self, "walking")

func exit():
	pass
