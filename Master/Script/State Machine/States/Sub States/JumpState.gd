extends AbilitiesState

class_name JumpState

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
	animationName = _animationName
	player = _player
	playerData = _playerData
	stateMachine = _stateMachine

func Enter() -> void: 
	super.Enter()
	player.inputManager.UseJumpInput()
	player.inAirState.DecreaseAmountOfJumpsLeft()
	player.SetVelocityY(-playerData.yJumpVelocity)

	isAbilitiesDone = true