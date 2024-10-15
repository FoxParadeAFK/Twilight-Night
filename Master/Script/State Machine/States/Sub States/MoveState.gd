extends GroundedState

class_name MoveState

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
  animationName = _animationName
  player = _player
  playerData = _playerData
  stateMachine = _stateMachine

func Update():
  super.Update()

  if (player.inputManager.normXInput == 0): stateMachine.ChangeState(player.idleState)