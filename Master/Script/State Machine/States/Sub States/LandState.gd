extends GroundedState

class_name LandState

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
	animationName = _animationName
	player = _player
	playerData = _playerData
	stateMachine = _stateMachine

func Enter():
	super.Enter()

func PhysicsUpdate(_delta : float) -> void:
	super.PhysicsUpdate(_delta)

	if (!isExitingState):
		
		if (xInput != 0): stateMachine.ChangeState(player.moveState)

		else:
			player.SetVelocityX(0)
			if (isAnimationFinished): stateMachine.ChangeState(player.idleState)
