extends CharacterBody2D

# Speed of the Character, When Moving
@export var SPEED: float = 145.0
# Acceleration of the Character, Increases the Speed with a Multiplier
@export var ACCELERATION: float = 15.0
# Animation Player
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Handles the Physics Process in the Game, Such as Movement Etc.
func _physics_process(_delta: float) -> void:
	movement()

# Handles the Movement of the Player Currently Manages 4D Movement
func movement() -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction == Vector2.ZERO:
		velocity = Vector2.ZERO
	else:
		velocity = direction * SPEED
	
	update_animation(direction)
	move_and_slide()

func update_animation(_direction: Vector2) -> void:
	pass
