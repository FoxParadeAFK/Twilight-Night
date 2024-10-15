extends Node

class_name State

var animationName : String
var player : Player 
var playerData : PlayerData
var stateMachine : StateMachine

func _init(_animationName : String, _player : Player, _playerData : PlayerData, _stateMachine : StateMachine):
	animationName = _animationName
	player = _player
	playerData = _playerData
	stateMachine = _stateMachine

func Enter() -> void:
	print("Current State => %s " % animationName)
	player.animationPlayer.play(animationName)


func Exit() -> void: pass

func Update() -> void:
	DoCheck()

func PhysicsUpdate() -> void: pass

func DoCheck() -> void: pass


