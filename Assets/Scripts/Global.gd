extends Node

enum modes { GAME_RUNNING, START_MENU, PAUSE_MENU, GAME_OVER }

signal mode_changed
signal score_updated(new_score)

var current_mode : modes
var player
var cursor
var player_stats
var _score: int = 0
var high_scores = [0, 0, 0, 0, 0]
var persistent_data = {}

func _ready():
	start_menu()


func _process(delta):
	pass


func start_menu():
	set_mode(modes.START_MENU)
	load_game()
	show_mouse()
	pause_game()
	
	
func start_game():
	set_mode(modes.GAME_RUNNING)
	hide_mouse()
	score_updated.emit(_score)
	unpause_game()


func game_over():
	show_mouse()
	update_high_score()
	save_game()
	set_mode(modes.GAME_OVER)
	pause_game()
	
	
func pause_menu():
	show_mouse()
	set_mode(modes.PAUSE_MENU)
	pause_game()
	
	
func exit_game():
	update_high_score()
	save_game()
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
	
func update_high_score():
	for index in high_scores.size():
		if _score < high_scores[index]:
			continue
		high_scores.insert(index, _score)
		high_scores.pop_back()
		break
	
func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		
		# Creates the helper class to interact with JSON
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object
		var node_data = json.get_data()
		high_scores.clear()
		for value in node_data["high_scores"]:
			high_scores.append(int(value))
		

func save_game():
	persistent_data["high_scores"] = high_scores
	
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	save_game.store_line(JSON.stringify(persistent_data))
	print("Saved " + str(persistent_data))
	save_game.close()
