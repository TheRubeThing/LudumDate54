extends Camera2D

@export var target : Node2D
@export var camera_speed : int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var diff = target.position - position
	position += diff * camera_speed / 100
	
