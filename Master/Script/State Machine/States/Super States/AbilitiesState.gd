extends State

class_name AbilitiesState

var isAbilitiesDone : bool

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
	animationName = _animationName
	player = _player
	playerData = _playerData
	stateMachine = _stateMachine

func Enter(): 
	super.Enter()

	isAbilitiesDone = false

func Update(_delta : float):
	super.Update(_delta)

	print(isAbilitiesDone)

	if (isAbilitiesDone && !player.is_on_floor()): stateMachine.ChangeState(player.inAirState)

