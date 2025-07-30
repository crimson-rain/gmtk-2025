extends State
class_name Walking

func enter():
	print("Entered Walking State")

func update(_delta: float):
	print("Update Walking State")
	
func physics_update(_delta: float):
	print("Physics Update Walking State")

func exit():
	print("Exit Walking State")
