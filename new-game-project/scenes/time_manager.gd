extends Node2D

@export var timeLabel : Label
var timePassed : int

func _ready() -> void:
	timePassed = 0

func _on_time_counter_timeout() -> void:
	timePassed += 1
	timeLabel.text = str(floor(timePassed / 60)).pad_zeros(2) + ":" + str(timePassed % 60).pad_zeros(2)
