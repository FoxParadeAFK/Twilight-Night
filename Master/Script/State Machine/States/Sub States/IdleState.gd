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

func Update() -> void:
  super.Update()

  if (player.inputManager.normXInput != 0): stateMachine.ChangeState(player.moveState)
