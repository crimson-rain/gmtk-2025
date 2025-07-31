extends CharacterBody2D

# Speed of the Character, When Moving
@export var SPEED: float = 145.0

# Acceleration of the Character, Increases the Speed with a Multiplier
@export var ACCELERATION: float = 15.0

# Animation Player
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Gets the last direction the player faced for idle animation
var last_direction: Vector2
