extends Area2D
class_name PressurePlate

var player_count: int = 0

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_count += 1
		if player_count == 1:
			GameManager.active_plates += 1
			
			if GameManager.active_plates == GameManager.expected_pressure_plates:
				GameManager.emit_signal("LevelComplete")

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_count -= 1
		if player_count == 0:
			GameManager.active_plates -= 1
