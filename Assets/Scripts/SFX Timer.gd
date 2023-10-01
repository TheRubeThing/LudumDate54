extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	start_timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func start_timer():
	start(randf_range(10,20))


func _on_timeout():
	get_parent().play()
	start_timer()
