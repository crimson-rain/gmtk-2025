extends Node
class_name State

signal Transitioned

# Called when entering the state
func Enter():
	print("Enter")

# Called every update
func Update(_delta: float):
	print("Update")

func PhysicsUpdate(_delta: float):
	print("Physics Update")

# Called when exiting the state
func Exit():
	print("Exit")
