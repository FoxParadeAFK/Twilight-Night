extends CharacterBody2D

class_name Player

var animationPlayer : AnimationPlayer
var playerData : PlayerData
var stateMachine : StateMachine
var inputManager : InputManager

var facingDirection : int = 1
var workspaceVector : Vector2

var idleState : IdleState
var moveState : MoveState
var jumpState : JumpState
var inAirState : InAirState
var landState : LandState

func _enter_tree() -> void:
	stateMachine = StateMachine.new()
	playerData = PlayerData.new()
	inputManager = InputManager.new()

	idleState = IdleState.new("Idle", self, playerData, stateMachine)
	moveState = MoveState.new("Move", self, playerData, stateMachine)
	jumpState = JumpState.new("InAir", self, playerData, stateMachine)
	inAirState = InAirState.new("InAir", self, playerData, stateMachine)
	landState = LandState.new("Land", self, playerData, stateMachine)

func _ready() -> void:
	animationPlayer = $AnimationPlayer	
	stateMachine.Initialize(idleState)

func _process(_delta: float) -> void: 
	stateMachine.currentState.Update(_delta)
	inputManager.Update()

func _physics_process(_delta: float) -> void:
	stateMachine.currentState.PhysicsUpdate(_delta)
	move_and_slide()

func _animation_finish_trigger() -> void: stateMachine.currentState.AnimationFinishedTrigger() 

func SetGravity(_yGravity : float) -> void:
	workspaceVector.y += _yGravity
	velocity = workspaceVector

func SetVelocityX(_xVelocity : float) -> void:
	workspaceVector = Vector2(_xVelocity, velocity.y)
	velocity = workspaceVector

func SetVelocityY(_yVelocity : float) -> void:
	workspaceVector = Vector2(velocity.x, _yVelocity)
	velocity = workspaceVector

func CheckIfTouchingGround() -> bool:
	return is_on_floor()

#region Flipping the player
func CheckIfShouldFlip(_xInput : int) -> void:
	if (_xInput != 0 && _xInput != facingDirection): Flip()

func Flip() -> void:
	facingDirection *= -1
	scale.y = facingDirection
	rotation_degrees = 180 if facingDirection == -1 else 0
#endregion 