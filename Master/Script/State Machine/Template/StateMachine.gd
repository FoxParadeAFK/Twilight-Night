extends Node

class_name StateMachine

var currentState : State

func Initialize(newState : State):
	currentState = newState
	currentState.Enter()

func ChangeState(newState : State):
	currentState.Exit()
	currentState = newState
	currentState.Enter()

