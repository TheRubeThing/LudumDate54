extends Panel


var modes

# Called when the node enters the scene tree for the first time.
func _ready():
	modes = Globals.modes
	Globals.connect("mode_changed", _on_mode_changed)
	_on_mode_changed()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Pause"):
		Globals.pause_menu()


func _on_mode_changed():
	$HighScore._process(0)
	if Globals.get_mode() == modes.PAUSE_MENU:
		visible = true
	else:
		visible = false


func _on_exit_game_pressed():
	Globals.exit_game()


func _on_resume_game_pressed():
	Globals.start_game()


func _on_restart_game_pressed():
	Globals.restart()
