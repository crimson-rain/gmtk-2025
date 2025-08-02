extends State
class_name PlayerWalkState

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
	var dash: bool = Input.is_action_pressed("dash")
	
	if dash == true and player.can_dash == true:
		Transitioned.emit(self, "dash")
		return
	
	if movement == Vector2.ZERO:
		Transitioned.emit(self, "idle")
		return
	
	player.velocity = movement.normalized() * player.SPEED
	
	var action = GhostData.new(player.velocity, movement.round(), "walk")
	player.recorded_actions.append(action)
	
	update_animation(movement)
	player.move_and_slide()

# We use a animation map to avoid becoming YandereDev
func update_animation(direction: Vector2):
	direction = direction.round()
	player.last_direction = direction
	player.play_animation(direction, "walk")
