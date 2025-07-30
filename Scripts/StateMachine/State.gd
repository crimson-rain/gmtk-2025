extends Node
class_name State

signal Transitioned

# Called when entering the state
func enter():
	print("Enter")

# Called every update
func update(_delta: float):
	print("Update")

func physics_update(_delta: float):
	print("Physics Update")

# Called when exiting the state
func exit():
	print("Exit")
