extends Node

class_name StateMachine

var currentState : State

func Initialize(newState : State) -> void:
	currentState = newState
	currentState.Enter()

func ChangeState(newState : State) -> void:
	currentState.Exit()
	currentState = newState
	currentState.Enter()
