extends Node

class_name State

var animationName : String
var player : Player 
var playerData : PlayerData
var stateMachine : StateMachine

var startTimeInMilliseconds : int

var isAnimationFinished : bool

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
	animationName = _animationName
	player = _player
	playerData = _playerData
	stateMachine = _stateMachine

func Enter() -> void:
	startTimeInMilliseconds = Time.get_ticks_msec()
	player.animationPlayer.play(animationName)

	print("?? Entered current state: %s at time %s" % [animationName, startTimeInMilliseconds])

	isAnimationFinished = false

func Exit() -> void: pass

func Update(_delta : float) -> void:
	pass

func PhysicsUpdate(_delta : float) -> void: 
	DoCheck()
	

func DoCheck() -> void: pass

func AnimationFinishedTrigger() -> void: 
	isAnimationFinished = true


