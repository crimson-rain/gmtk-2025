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
	player.velocity = player.last_direction.normalized() * player.SPEED * player.DASH_SPEED_MULTIPLIER
	update_animation(player.last_direction)
	player.move_and_slide()

# We use a animation map to avoid becoming YandereDev
func update_animation(direction: Vector2):
	direction = direction.round()
	player.last_direction = direction
	var action = GhostData.new(player.velocity, direction.round(), "dash")
	player.recorded_actions.append(action)
	
	player.play_animation(direction, "dash")

func _on_dash_animation_finished(anim_name: String) -> void:
	var last_anim = "dash" + player.animation_map[player.last_direction]
	if anim_name == last_anim:
		Transitioned.emit(self, "idle")

func _on_dash_cooldown_timer_timeout() -> void:
	player.can_dash = true
