extends Camera2D

@export var target : Node2D
@export var camera_speed : int


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var diff = target.position - position
	position += diff * delta * camera_speed / 100
	
