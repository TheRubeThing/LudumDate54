extends Node

enum modes { GAME_RUNNING, START_MENU, PAUSE_MENU, GAME_OVER }

signal mode_changed

var current_mode : modes
var player
var player_stats

func _ready():
	start_menu()


func _process(delta):
	pass


func start_menu():
	set_mode(modes.START_MENU)
	pause_game()
	
	
func start_game():
	set_mode(modes.GAME_RUNNING)
	unpause_game()


func game_over():
	set_mode(modes.GAME_OVER)
	pause_game()
	
	
func pause_menu():
	set_mode(modes.PAUSE_MENU)
	pause_game()
	
	
func exit_game():
	get_tree().quit()


func restart():
	get_tree().reload_current_scene()
	start_menu()


func get_mode():
	return current_mode
	

func set_mode(newMode):
	current_mode = newMode
	emit_signal("mode_changed")


func pause_game():
	get_tree().paused = true


func unpause_game():
	get_tree().paused = false
