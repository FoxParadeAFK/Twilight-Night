extends GroundedState

class_name MoveState

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
  animationName = _animationName
  player = _player
  playerData = _playerData
  stateMachine = _stateMachine
  

func Update(_delta : float):
  super.Update(_delta)

  player.CheckIfShouldFlip(xInput)

  if (player.inputManager.normXInput == 0): stateMachine.ChangeState(player.idleState)

func PhysicsUpdate(_delta : float):
  super.PhysicsUpdate(_delta)

  player.SetVelocityX(playerData.xMovementVelocity * xInput)
