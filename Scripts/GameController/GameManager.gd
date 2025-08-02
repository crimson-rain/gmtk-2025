extends Node
class_name GameController

@export var expected_pressure_plates: int = 3

var active_plates: int

signal LevelComplete

func _init() -> void:
	active_plates = 0
	LevelComplete.connect(_on_level_complete)

func _on_level_complete() -> void:
	print("Completed Level")
