extends Node

enum modes { GAME_RUNNING, START_MENU, PAUSE_MENU, GAME_OVER }

signal mode_changed
signal score_updated(new_score)

var current_mode : modes
var player
var cursor
var player_stats
var _score: int = 0

func _ready():
	start_menu()


func _process(delta):
	pass


func start_menu():
	set_mode(modes.START_MENU)
	show_mouse()
	pause_game()
	
	
func start_game():
	set_mode(modes.GAME_RUNNING)
	hide_mouse()
	score_updated.emit(_score)
	unpause_game()


func game_over():
	show_mouse()
	set_mode(modes.GAME_OVER)
	pause_game()
	
	
func pause_menu():
	show_mouse()
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
	
func add_to_score(score: int):
	_score += score
	score_updated.emit(_score)
	
func show_mouse():
	if self.cursor:
		self.cursor.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func hide_mouse():
	if self.cursor:
		self.cursor.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
