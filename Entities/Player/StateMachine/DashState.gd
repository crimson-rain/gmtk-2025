extends State
class_name PlayerDash

@onready var player: CharacterBody2D = $"../.."

func enter() -> void:
	player.can_dash = false
	$DashCooldownTimer.start()
	player.animation_player.animation_finished.connect(_on_dash_animation_finished)

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	handle_movement()

func exit() -> void:
	if player.animation_player.animation_finished.is_connected(_on_dash_animation_finished):
		player.animation_player.animation_finished.disconnect(_on_dash_animation_finished)

# Handle Movement in this function
func handle_movement() -> void:
	player.velocity = player.last_direction * player.SPEED * player.DASH_SPEED_MULTIPLIER
	update_animation(player.last_direction)
	player.move_and_slide()

# We use a animation map to avoid becoming YandereDev
func update_animation(direction: Vector2):
	direction = direction.round()
	player.last_direction = direction
	
	player.animation_player.speed_scale = 0.45*player.DASH_SPEED_MULTIPLIER
	
	var animation_map = {
		Vector2(0, -1): "dash_up",
		Vector2(0, 1): "dash_down",
		Vector2(-1, -1): "dash_left_up",
		Vector2(1, -1): "dash_right_up",
		Vector2(-1, 1): "dash_left_down",
		Vector2(1, 1): "dash_right_down",
		Vector2(-1, 0): "dash_left_down",
		Vector2(1, 0): "dash_right_down"
	}
	
	player.animation_player.play(animation_map[direction])

func _on_dash_animation_finished(anim_name) -> void:
	var animation_map = {
		Vector2(0, -1): "dash_up",
		Vector2(0, 1): "dash_down",
		Vector2(-1, -1): "dash_left_up",
		Vector2(1, -1): "dash_right_up",
		Vector2(-1, 1): "dash_left_down",
		Vector2(1, 1): "dash_right_down",
		Vector2(-1, 0): "dash_left_down",
		Vector2(1, 0): "dash_right_down"
	}
	
	if anim_name == animation_map[player.last_direction]:
		Transitioned.emit(self, "idle")

func _on_dash_cooldown_timer_timeout() -> void:
	player.can_dash = true
