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
	$HighScore._process(0)
	if Globals.get_mode() == modes.GAME_OVER:
		visible = true
	else:
		visible = false


func _on_main_menu_pressed():
	print("hej")
	Globals.restart()
