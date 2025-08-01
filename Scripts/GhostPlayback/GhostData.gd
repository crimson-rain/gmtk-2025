class_name GhostData

var velocity: Vector2
var movement: Vector2
var state: String

func _init(_velocity: Vector2, _movement: Vector2, _state: String):
	velocity = _velocity
	movement = _movement
	state = _state

func display_data():
	print("Velocity: ", velocity, "Movement: ", movement, "State: ", state)
