extends State

class_name InAirState

var xInput : int
var jumpInput : bool

var amountOfJumpsLeft : int
const amountOfJumps : int = 2

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
  animationName = _animationName
  player = _player
  playerData = _playerData
  stateMachine = _stateMachine

  amountOfJumpsLeft = amountOfJumps

func Update(_delta : float) -> void:
  super.Update(_delta)

  xInput = player.inputManager.normXInput  
  jumpInput = player.inputManager.jumpInput

  var animationFrame : float = (player.velocity.y + playerData.yJumpVelocity) / (playerData.yJumpVelocity * 2 / player.animationPlayer.current_animation_length)
  player.animationPlayer.seek(round(animationFrame), true)



func PhysicsUpdate(_delta : float) -> void:
  super.PhysicsUpdate(_delta)

  if (player.CheckIfTouchingGround()): stateMachine.ChangeState(player.landState)

  elif (jumpInput && CanJump()): stateMachine.ChangeState(player.jumpState)

  else:
    player.CheckIfShouldFlip(xInput)
    player.SetGravity(playerData.defaultGraity * _delta)
    player.SetVelocityX(playerData.xMovementVelocity * xInput)


func CanJump() -> bool: return false if amountOfJumpsLeft == 0 else true

func ResetAmountOfJumpsLeft() -> void: amountOfJumpsLeft = amountOfJumps

func DecreaseAmountOfJumpsLeft() -> void: amountOfJumpsLeft -= 1