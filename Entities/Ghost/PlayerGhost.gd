extends CharacterBody2D
class_name PlayerGhost

var playback: Array[GhostData] = []
var playback_index: int = 0
var is_playback: bool = true
var start_position: Vector2
var player_global: Vector2

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	if not is_playback:
		return
	
	if playback.size() > playback_index:
		velocity = playback[playback_index].velocity
		move_and_slide()
		update_animation()
		playback_index += 1
	else:
		velocity = Vector2.ZERO
		is_playback = false
		print("Ghost Playback Finished")

func setup_playback(_playback_data: Array[GhostData], start_pos: Vector2):
	self.playback = _playback_data
	self.global_position = start_pos
	self.playback_index = 0
	self.is_playback = true

func update_animation() -> void:
	var walk_animation_map = {
		Vector2(0, -1): "walk_up",
		Vector2(0, 1): "walk_down",
		Vector2(-1, -1): "walk_left_up",
		Vector2(1, -1): "walk_right_up",
		Vector2(-1, 1): "walk_left_down",
		Vector2(1, 1): "walk_right_down",
		Vector2(-1, 0): "walk_left_down",
		Vector2(1, 0): "walk_right_down"
	}
	
	var movement = playback[playback_index].movement
	movement.round()
	
	animation_player.play(walk_animation_map[movement])
