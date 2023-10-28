extends Node

signal start_round()

@onready var player_label = $MatchResults/PlayerChoice
@onready var computer_label = $MatchResults/ComputerChoice
@onready var results_label = $MatchResults/Result
var play_choices: Array = ['rock', 'paper', 'scissors']

func _process(_delta):
	if Input.is_action_pressed("menu"):
		get_tree().change_scene_to_file("res://scenes/menu_ui.tscn")


func _on_choice_manager_player_picks_choice(choice):
	player_label.text = 'You picked ' + choice
	run_match(choice)


func run_match(choice: String):
	var computer_choice = play_choices.find(computer_make_choice())
	var player_choice = play_choices.find(choice)
	if player_choice == computer_choice:
		computer_label.text = 'The computer chose ' + play_choices[computer_choice]
		results_label.text = 'Its a tie'
	elif (player_choice + 1) % 3 == computer_choice:
		computer_label.text = 'The computer chose ' + play_choices[computer_choice]
		results_label.text = 'You lose.'
	else:
		print('The computer chose ' + play_choices[computer_choice])
		computer_label.text = 'The computer chose ' + play_choices[computer_choice]
		results_label.text = 'You win!'
	
	
func computer_make_choice():
	return play_choices.pick_random()

