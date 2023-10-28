extends Node

signal player_picks_choice(choice)

@export var player_choice: String = ''


func _on_rock_button_up():
	player_picks_choice.emit('rock')


func _on_paper_button_up():
	player_picks_choice.emit('paper')


func _on_scissors_button_up():
	player_picks_choice.emit('scissors')
