extends MarginContainer

@export var titleCont : VBoxContainer
@export var modelCont : VBoxContainer
@export var diffCont : VBoxContainer

@export var roundsCont : VBoxContainer

@export var titleButt : VBoxContainer
@export var modeButt : VBoxContainer
@export var diffButt : VBoxContainer
@export var bgImage : Control

@export var victCont : VBoxContainer
@export var victLabel : Label

@export var main : Main

func _ready() -> void:
	titleCont.show()
	titleButt.show()
	victLabel.text = ""
	bgImage.show()
	modelCont.hide()
	modeButt.hide()
	diffCont.hide()
	diffButt.hide()
	roundsCont.hide()

func _on_button_pressed() -> void:
	titleCont.hide()
	titleButt.hide()
	victLabel.text = ""
	
	modelCont.show()
	modeButt.show()

func _on_button_2_pressed() -> void:
	get_tree().quit()


func _on_player_pressed() -> void:
	modelCont.hide()
	modeButt.hide()
	GameParams.qtyPlayer = 1
	
	diffCont.show()
	diffButt.show()

func _on_players_pressed() -> void:
	modelCont.hide()
	modeButt.hide()
	
	GameParams.qtyPlayer = 2
	GameParams.level = 1
	
	roundsCont.show()


func _on_easy_pressed() -> void:
	GameParams.level = 1
	diffCont.hide()
	diffButt.hide()
	roundsCont.show()

func _on_normal_pressed() -> void:
	GameParams.level = 2
	diffCont.hide()
	diffButt.hide()
	roundsCont.show()

func _on_hard_pressed() -> void:
	GameParams.level = 3
	diffCont.hide()
	diffButt.hide()
	roundsCont.show()


func _on_line_edit_text_submitted(new_text: String) -> void:
	GameParams.rounds = int(new_text)
	roundsCont.hide()
	bgImage.hide()
	main.startTheGame()
	
func victory(playerWon : bool, machineWon : bool):
	bgImage.show()
	titleButt.show()
	if playerWon and !machineWon:
		victLabel.text = "Player 1 has won!"
	elif !playerWon and machineWon:
		victLabel.text = "Player 2 has won!"
	else:
		victLabel.text = "Everybody won!"


func _on_main_finished(player: bool, machine: bool) -> void:
	victory(player, machine)
