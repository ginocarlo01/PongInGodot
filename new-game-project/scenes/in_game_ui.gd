extends Control

@export var playerPoints : Label
@export var machinePoints : Label
@export var startLabel : Label
@export var startTimer : Timer

func _on_point_manager_point_changed(player: bool, points: int) -> void:
	if !player:
		machinePoints.text = str(points)
	else:
		playerPoints.text = str(points)
		
func _process(delta: float) -> void:
	startLabel.text = str(int(startTimer.time_left)+1)


func _on_start_game_timeout() -> void:
	startLabel.hide()
