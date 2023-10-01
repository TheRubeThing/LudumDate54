extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_parent().add_child(self)
	play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	queue_free()
