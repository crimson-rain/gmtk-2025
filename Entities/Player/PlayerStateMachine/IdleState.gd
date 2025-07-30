extends State
class_name Idle

func Enter():
	print("Entered Idle State")

func Update(_delta: float):
	print("Update Idle State")
	
func PhysicsUpdate(_delta: float):
	print("Physics Update Idle State")

func Exit():
	print("Exit Idle State")
