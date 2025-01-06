class_name Main
extends Node2D

signal finished(player : bool, machine :  bool)
signal sendPointsUI(player : int, machine :  int)

@export var ball : Ball
@export var player : Player
@export var machine : Machine

@export var startBallPosition : Marker2D
@export var startPlayerPosition : Marker2D
@export var startMachinePosition : Marker2D

@export var startTimer: Timer
@export var counterTimer: Timer

@export var startLabel : Label

var roundsCounter : int = 0
var playerCounter : int = 0
var machineCounter : int = 0

func _ready() -> void:
	ball.position = startBallPosition.position
	player.position = startPlayerPosition.position
	machine.position = startMachinePosition.position

func startTheGame():
	startTimer.start()
	startLabel.show()
	
	roundsCounter = 0
	playerCounter = 0
	machineCounter = 0
	sendPointsUI.emit(playerCounter, machineCounter)
	
func _on_start_game_timeout() -> void:
	setAllObjects(true)
	ball.start(startBallPosition.position)
	player.start(startPlayerPosition.position)
	machine.start(startMachinePosition.position)
	if counterTimer.is_stopped():
		counterTimer.start()

func _on_ball_2_left_wall_signal() -> void:
	stopGame(false)

func _on_ball_2_right_wall_signal() -> void:
	stopGame(true)
		
func stopGame(playerWon : bool):
	roundsCounter+=1
	ball.position = startBallPosition.position
	player.position = startPlayerPosition.position
	machine.position = startMachinePosition.position
	
	if playerWon:
		playerCounter+=1
	else:
		machineCounter+=1
	sendPointsUI.emit(playerCounter, machineCounter)
	if checkGameOver():
		return
	setAllObjects(false)
	
	
	startTimer.start()
	startLabel.show()
	
func checkGameOver():
	if roundsCounter >= GameParams.rounds:
		counterTimer.stop()
		if playerCounter > machineCounter:
			finished.emit(true, false)
		elif playerCounter < machineCounter:
			finished.emit(false, true)
		else:
			finished.emit(true, true)
		setAllObjects(false)
		return true
	else:
		return false
		
func setAllObjects(value : bool):
	player.set_process(value)
	player.set_physics_process(value)
	machine.set_process(value)
	machine.set_physics_process(value)
	ball.position = startBallPosition.position
	ball.set_process(value)
	ball.set_physics_process(value)
