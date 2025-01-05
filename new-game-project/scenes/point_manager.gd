extends Node2D

signal pointChanged(player : bool, points : int)

var playerPoints = 0
var machinePoints = 0


func _on_ball_left_wall_signal() -> void:
	machinePoints += 1
	pointChanged.emit(false, machinePoints)
