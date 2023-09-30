extends AnimatedSprite2D

var floor_blood_scene = preload("res://Assets/FX/floor_blood.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")


func _on_animation_finished():
	stop()
	var floor_blood = floor_blood_scene.instantiate()
	floor_blood.position = position
	get_parent().get_parent().add_child(floor_blood)
	self.queue_free()
