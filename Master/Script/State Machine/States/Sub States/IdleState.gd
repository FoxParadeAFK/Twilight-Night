extends GroundedState

class_name IdleState 

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
  animationName = _animationName
  player = _player
  playerData = _playerData
  stateMachine = _stateMachine

func Enter() -> void:
  super.Enter()
  player.SetVelocityX(0)

func Update(_delta : float) -> void:
  super.Update(_delta)


func PhysicsUpdate(_delta : float) -> void:
  super.PhysicsUpdate(_delta)

  if (xInput != 0 && !isExitingState): stateMachine.ChangeState(player.moveState)