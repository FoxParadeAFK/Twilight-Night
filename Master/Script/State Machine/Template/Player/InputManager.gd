extends Node

class_name InputManager

var rawMovementInput : float
var normXInput : int


var jumpInput : bool


func Update():
	OnMoveInput()
	OnJumpInput()

func OnMoveInput():
	rawMovementInput = Input.get_axis("Move_Left", "Move_Right")
	normXInput = roundi(rawMovementInput)

func OnJumpInput():
	if (Input.is_action_just_pressed("Jump")):
		jumpInput = true;

	if (Input.is_action_just_released("Jump")):
		jumpInput = false;

