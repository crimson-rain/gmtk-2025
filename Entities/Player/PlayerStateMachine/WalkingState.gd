extends State
class_name Walking

func Enter():
	print("Entered Walking State")

func Update(_delta: float):
	print("Update Walking State")
	
func PhysicsUpdate(_delta: float):
	print("Physics Update Walking State")

func Exit():
	print("Exit Walking State")
