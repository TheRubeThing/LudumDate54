extends CanvasLayer

enum modes { GAME_RUNNING, START_MENU, PAUSE_MENU, GAME_OVER }

# Called when the node enters the scene tree for the first time.
func _ready():
	start_screen()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start_screen():
	Globals.set_mode(modes.START_MENU)
	Globals.pause_game()
