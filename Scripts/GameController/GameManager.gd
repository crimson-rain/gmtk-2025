extends Node
class_name GameController

@export var expected_pressure_plates: int = 3

var active_plates: int

func _init() -> void:
	active_plates = 0

func _process(_delta: float) -> void:
	if active_plates == expected_pressure_plates:
		print("All Pressure Plates Active Game Complete")
	
	print(active_plates)
