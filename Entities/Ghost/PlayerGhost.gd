extends CharacterBody2D
class_name PlayerGhost

var playback: Array[GhostData] = []
var playback_index: int = 0
var is_playback: bool = true
var start_position: Vector2
var player_global: Vector2
var last_direction: Vector2

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var animation_map = {
	Vector2(0, -1): "_up",
	Vector2(0, 1): "_down",
	Vector2(-1, -1): "_left_up",
	Vector2(1, -1): "_right_up",
	Vector2(-1, 1): "_left_down",
	Vector2(1, 1): "_right_down",
	Vector2(-1, 0): "_left_down",
	Vector2(1, 0): "_right_down"
}

func _physics_process(_delta: float) -> void:
	if not is_playback:
		return
	
	if playback.size() > playback_index:
		velocity = playback[playback_index].velocity
		move_and_slide()
		update_animation()
		playback_index += 1
	else:
		velocity = Vector2.ZERO
		playback.clear()
		playback_index = 0
		is_playback = false
		print("Ghost Playback Finished")

func setup_playback(_playback_data: Array[GhostData], start_pos: Vector2):
	self.playback = _playback_data
	self.global_position = start_pos
	self.playback_index = 0
	self.is_playback = true

func update_animation() -> void:
	var movement = playback[playback_index].movement.round()
	var state = playback[playback_index].state
	last_direction = movement
	
	if state == "walking":
		animation_player.speed_scale = 0.55
	else:
		animation_player.speed_scale = 0.45
	
	var animation_string = state + animation_map[movement]
	animation_player.play(animation_string)
