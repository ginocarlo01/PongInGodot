extends Node2D

@export var ball : Ball
@export var player : Player
@export var machine : Machine

@export var startBallPosition : Marker2D
@export var startPlayerPosition : Marker2D
@export var startMachinePosition : Marker2D

@export var startTimer: Timer
@export var counterTimer: Timer

@export var startLabel : Label

func _ready() -> void:
	startTimer.start()
	
func _on_start_game_timeout() -> void:
	ball.start(startBallPosition.position)
	player.start(startPlayerPosition.position)
	machine.start(startMachinePosition.position)
	counterTimer.start()

func _on_ball_2_left_wall_signal() -> void:
	stopGame()
	
func _on_ball_2_right_wall_signal() -> void:
	stopGame()
	
func stopGame():
	player.canMove = false
	player.hide()
	machine.hide()
	startLabel.show()
	startTimer.start()
