extends Node

enum modes { GAME_RUNNING, START_MENU, PAUSE_MENU, GAME_OVER }

var current_mode : modes
var player
var player_stats

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_mode(newMode):
	current_mode = newMode
	
	
func pause_game():
	get_tree().paused = true
	
	
func unpause_game():
	get_tree().paused = false
