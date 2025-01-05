extends Control

@export var playerPoints : Label
@export var machinePoints : Label


func _on_point_manager_point_changed(player: bool, points: int) -> void:
	if !player:
		machinePoints.text = str(points)
	else:
		playerPoints.text = str(points)
