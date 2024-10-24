extends State

class_name AbilitiesState

var isAbilitiesDone : bool

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
	animationName = _animationName
	player = _player
	playerData = _playerData
	stateMachine = _stateMachine

func Enter() -> void: 
	super.Enter()

	isAbilitiesDone = false

func Update(_delta : float) -> void:
	super.Update(_delta)

func PhysicsUpdate(_delta : float) -> void:
	super.PhysicsUpdate(_delta)

	if (isAbilitiesDone && player.CheckIfTouchingGround()): stateMachine.ChangeState(player.idleState)
	elif (isAbilitiesDone && !player.CheckIfTouchingGround()): stateMachine.ChangeState(player.inAirState)


