extends State

class_name GroundedState

var xInput : int

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
  animationName = _animationName
  player = _player
  playerData = _playerData
  stateMachine = _stateMachine

func Update(_delta : float):
  super.Update(_delta)
  
  xInput = player.inputManager.normXInput

  if (!player.CheckIfTouchingGround()): stateMachine.ChangeState(player.inAirState)
  if (player.inputManager.jumpInput): stateMachine.ChangeState(player.jumpState)


