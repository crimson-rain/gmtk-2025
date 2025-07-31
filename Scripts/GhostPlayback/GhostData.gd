class_name GhostData
var velocity: Vector2

func _init(p_velocity: Vector2):
	velocity = p_velocity

func display_data():
	print("Velocity: ", velocity)
