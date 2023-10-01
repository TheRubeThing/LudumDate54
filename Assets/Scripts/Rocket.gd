extends Bullet

var explosion_scene = preload("res://Assets/Weapons/explosion.tscn")

func destroy():
	var explosion = explosion_scene.instantiate()
	explosion.position = position
	get_parent().add_child(explosion)
	queue_free()

