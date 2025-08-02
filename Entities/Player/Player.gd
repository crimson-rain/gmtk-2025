extends CharacterBody2D

# Speed of the Character, When Moving
@export var SPEED: float = 145.0

# Used to set the movement and animation speed for dash
@export var DASH_SPEED_MULTIPLIER: float = 1.75

@onready var can_dash: bool = true

# Acceleration of the Character, Increases the Speed with a Multiplier
@export var ACCELERATION: float = 15.0

# Animation Player
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var ghost_scene = preload("res://Entities/Ghost/PlayerGhost.tscn")

# Gets the last direction the player faced for idle animation
var last_direction: Vector2
var start_position: Vector2
var recorded_actions: Array[GhostData] = []

func _ready() -> void:
	call_deferred("_set_start_position")
	last_direction = Vector2(0, 1)

func _set_start_position() -> void:
	start_position = global_position
	print(start_position)

func _on_ghost_timer_timeout() -> void:
	var ghost = ghost_scene.instantiate()
	get_parent().add_child(ghost)
	ghost.setup_playback(recorded_actions, start_position)
	start_position = global_position
