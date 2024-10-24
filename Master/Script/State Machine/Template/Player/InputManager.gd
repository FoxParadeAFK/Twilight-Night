extends Node

class_name InputManager

var rawMovementInput : float
var normXInput : int

var jumpInputStartTimeInMilliseconds : int
const jumpInputHoldTimeInMilliseconds : int = 170
var jumpInput : bool


func Update() -> void:
	OnMoveInput()
	OnJumpInput()

	print(jumpInput)

	CheckJumpInputHold()

func OnMoveInput() -> void:
	rawMovementInput = Input.get_axis("Move_Left", "Move_Right")
	normXInput = roundi(rawMovementInput)

func OnJumpInput() -> void:
	if (Input.is_action_just_pressed("Jump")):
		jumpInputStartTimeInMilliseconds = Time.get_ticks_msec()
		jumpInput = true;

func UseJumpInput() -> void: jumpInput = false

func CheckJumpInputHold() -> void:
	if (Time.get_ticks_msec() > jumpInputStartTimeInMilliseconds + jumpInputHoldTimeInMilliseconds):
		jumpInput = false
