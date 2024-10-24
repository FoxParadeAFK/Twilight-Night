extends GroundedState

class_name MoveState

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
  animationName = _animationName
  player = _player
  playerData = _playerData
  stateMachine = _stateMachine
  

func Update(_delta : float) -> void:
  super.Update(_delta)



func PhysicsUpdate(_delta : float) -> void:
  super.PhysicsUpdate(_delta)

  player.CheckIfShouldFlip(xInput)
  player.SetVelocityX(playerData.xMovementVelocity * xInput)

  if (player.inputManager.normXInput == 0 && !isExitingState): stateMachine.ChangeState(player.idleState)