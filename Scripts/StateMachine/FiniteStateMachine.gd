extends Node
class_name FiniteStateMachine

var current_state: State


func _init() -> void:
	current_state = IdleState.new()

func _process(_delta: float) -> void:
	
	if current_state == null:
		return
		
	current_state.Update()

func switch_state(new_state: State):
	current_state.Exit()
	current_state = new_state
	current_state.Enter()
