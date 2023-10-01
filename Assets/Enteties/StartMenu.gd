extends Panel


var modes

# Called when the node enters the scene tree for the first time.
func _ready():
	modes = Globals.modes
	Globals.connect("mode_changed", _on_mode_changed)
	_on_mode_changed()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mode_changed():
	if Globals.get_mode() == modes.START_MENU:
		visible = true
	else:
		visible = false


func _on_start_game_pressed():
	Globals.start_game()



func _on_exit_game_pressed():
	Globals.exit_game()
