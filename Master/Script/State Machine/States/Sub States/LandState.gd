extends GroundedState

class_name LandState

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
	animationName = _animationName
	player = _player
	playerData = _playerData
	stateMachine = _stateMachine

func Update(_delta : float):
	super.Update(_delta)

	if (player.inputManager.normXInput != 0): stateMachine.ChangeState(player.moveState)
	
	if (isAnimationFinished && player.inputManager.normXInput == 0): stateMachine.ChangeState(player.idleState)
