extends Node2D

@export var deathSFX : AudioStreamPlayer2D
@export var victorySFX : AudioStreamPlayer2D
@export var startSFX : AudioStreamPlayer2D
@export var hitSFX : AudioStreamPlayer2D

func _on_ball_2_collided() -> void:
	hitSFX.play()

func _on_ball_2_left_wall_signal() -> void:
	deathSFX.play()

func _on_ball_2_right_wall_signal() -> void:
	victorySFX.play()

func _on_line_edit_text_submitted(new_text: String) -> void:
	startSFX.play()
