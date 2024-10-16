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

func _enter_tree() -> void:
	stateMachine = StateMachine.new()
	playerData = PlayerData.new()
	inputManager = InputManager.new()

	idleState = IdleState.new("Idle", self, playerData, stateMachine)
	moveState = MoveState.new("Move", self, playerData, stateMachine)

func _ready() -> void:
	animationPlayer = $AnimationPlayer
	
	stateMachine.Initialize(idleState)

func _process(_delta: float) -> void: 
	stateMachine.currentState.Update()
	inputManager.Update()

func _physics_process(_delta: float) -> void:
	stateMachine.currentState.PhysicsUpdate()
	move_and_slide()

func SetVelocityX(velocityX : float) -> void:
	workspaceVector = Vector2(velocityX, velocity.y)
	velocity = workspaceVector

func CheckIfShouldFlip(xInput : int) -> void:
	if (xInput != 0 && xInput != facingDirection): Flip()

func Flip() -> void:
	facingDirection *= -1
	scale.y = facingDirection
	rotation_degrees = 180 if facingDirection == -1 else 0
