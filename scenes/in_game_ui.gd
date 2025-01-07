extends Control

@export var playerPoints : Label
@export var machinePoints : Label
@export var startLabel : Label
@export var startTimer : Timer
		
func _process(delta: float) -> void:
	startLabel.text = str(int(startTimer.time_left)+1)

func _on_start_game_timeout() -> void:
	startLabel.hide()


func _on_main_send_points_ui(player: int, machine: int) -> void:
	machinePoints.text = str(machine)
	playerPoints.text = str(player)
