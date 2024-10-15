extends State

class_name GroundedState

var xInput : int

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
  animationName = _animationName
  player = _player
  playerData = _playerData
  stateMachine = _stateMachine

func Update():
  xInput = player.inputManager.normXInput

  super.Update()

