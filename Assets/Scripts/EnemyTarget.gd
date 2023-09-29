extends Sprite2D

var follow: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_viewport().get_mouse_position()
	
func _input(event):
	if event is InputEventMouseButton:
		if not follow:
			follow = true
			get_tree().call_group("ENEMIES", "add_target", self)
		else:
			follow = false
			get_tree().call_group("ENEMIES", "remove_target")
