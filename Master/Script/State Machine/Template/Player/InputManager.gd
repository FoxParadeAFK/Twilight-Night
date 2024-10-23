extends Node

class_name InputManager

var rawMovementInput : float
var normXInput : int


var jumpInput : bool


func Update() -> void:
	OnMoveInput()
	OnJumpInput()

func OnMoveInput() -> void:
	rawMovementInput = Input.get_axis("Move_Left", "Move_Right")
	normXInput = roundi(rawMovementInput)

func OnJumpInput() -> void:
	if (Input.is_action_just_pressed("Jump")):
		jumpInput = true;

func UseJumpInput() -> void: jumpInput = false
