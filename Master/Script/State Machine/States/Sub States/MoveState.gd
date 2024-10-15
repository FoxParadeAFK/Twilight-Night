extends GroundedState

class_name MoveState

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
  animationName = _animationName
  player = _player
  playerData = _playerData
  stateMachine = _stateMachine

func Update():
  super.Update()
  
  player.CheckIfShouldFlip(xInput)
  player.SetVelocityX(300 * xInput)

  if (player.inputManager.normXInput == 0): stateMachine.ChangeState(player.idleState)