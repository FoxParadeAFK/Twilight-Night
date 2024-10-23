extends State

class_name InAirState

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
  animationName = _animationName
  player = _player
  playerData = _playerData
  stateMachine = _stateMachine

func Enter():
  super.Enter()

func Update(_delta : float) -> void:
  super.Update(_delta)

  var animationFrame : float = (player.velocity.y + playerData.yJumpVelocity) / (playerData.yJumpVelocity * 2 / 6)
  player.animationPlayer.seek(round(animationFrame), true)

  if (player.CheckIfTouchingGround() && player.velocity.y < 0.01): stateMachine.ChangeState(player.landState)

func PhysicsUpdate(_delta : float) -> void:
  super.PhysicsUpdate(_delta)


  player.SetGravity(playerData.defaultGraity * _delta)