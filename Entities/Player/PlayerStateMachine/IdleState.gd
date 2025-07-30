extends State
class_name Idle

func enter():
	print("Entered Idle State")

func update(_delta: float):
	print("Update Idle State")

func physics_update(_delta: float):
	print("Physics Update Idle State")

func exit():
	print("Exit Idle State")
