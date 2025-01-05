extends Node2D

@export var ball : Ball
@export var player : Player
@export var machine : Machine

@export var startBallPosition : Marker2D
@export var startPlayerPosition : Marker2D
@export var startMachinePosition : Marker2D

func _ready() -> void:
	ball.start(startBallPosition.position)
	player.start(startPlayerPosition.position)
	machine.start(startMachinePosition.position)
