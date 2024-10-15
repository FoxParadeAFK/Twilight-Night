extends Node

class_name InputManager

var rawMovementInput : float
var normXInput : int


func Update():
	OnMoveInput()

func OnMoveInput():
	rawMovementInput = Input.get_axis("Move_Left", "Move_Right")
	normXInput = roundi(rawMovementInput)

