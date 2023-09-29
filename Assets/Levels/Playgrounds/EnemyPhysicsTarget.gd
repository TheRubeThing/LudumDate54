extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var velocity = get_viewport().get_mouse_position() - position
	move_and_collide(velocity)
