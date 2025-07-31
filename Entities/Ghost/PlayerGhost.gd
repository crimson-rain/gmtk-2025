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
		playback_index += 1
		print("Playback Index: ", playback_index)
	else:
		velocity = Vector2.ZERO
		is_playback = false
		print("Ghost Playback Finished")

func setup_playback(_playback_data: Array[GhostData], start_pos: Vector2):
	self.playback = _playback_data
	self.global_position = start_pos
	self.playback_index = 0
	self.is_playback = true
