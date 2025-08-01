extends CharacterBody2D
class_name PlayerGhost

var playback: Array[GhostData] = []
var playback_index: int = 0
var is_playback: bool = true
var start_position: Vector2
var player_global: Vector2
var last_direction: Vector2

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
	var movement = playback[playback_index].movement.round()
	var state = playback[playback_index].state
	
	if state == "walking":
		last_direction = movement
		animation_player.speed_scale = 0.55
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
		
		animation_player.play(walk_animation_map[movement])
	else:
		animation_player.speed_scale = 0.45
		var idle_animation_map = {
			Vector2(0, -1): "idle_up",
			Vector2(0, 1): "idle_down",
			Vector2(-1, -1): "idle_left_up",
			Vector2(1, -1): "idle_right_up",
			Vector2(-1, 1): "idle_left_down",
			Vector2(1, 1): "idle_right_down",
			Vector2(-1, 0): "idle_left_down",
			Vector2(1, 0): "idle_right_down",
			Vector2(0, 0): "idle_down"
		}
		
		animation_player.play(idle_animation_map[last_direction])
