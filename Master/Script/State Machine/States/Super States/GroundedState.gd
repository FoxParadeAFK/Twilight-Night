extends State

class_name GroundedState

var xInput : int
var jumpInput : bool

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
  animationName = _animationName
  player = _player
  playerData = _playerData
  stateMachine = _stateMachine
func Enter() -> void:
  super.Enter()

  player.inAirState.ResetAmountOfJumpsLeft()

func Update(_delta : float):
  super.Update(_delta)
  
  xInput = player.inputManager.normXInput
  jumpInput = player.inputManager.jumpInput  

  if (!player.CheckIfTouchingGround()): stateMachine.ChangeState(player.inAirState)
  if (jumpInput && player.inAirState.CanJump()): stateMachine.ChangeState(player.jumpState)


