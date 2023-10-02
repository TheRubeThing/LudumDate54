extends Bullet

var explosion_scene = preload("res://Assets/Weapons/explosion.tscn")
var target_bullet_speed = 0
var speedup_factor = 0.99

func _process(delta):
	bullet_speed = speedup_factor * bullet_speed + (1 - speedup_factor) * target_bullet_speed
	super._process(delta)

func destroy():
	var explosion = explosion_scene.instantiate()
	explosion.position = position
	get_parent().add_child(explosion)
	queue_free()

func set_bullet_speed(speed):
	bullet_speed = (1 - speedup_factor) * speed
	target_bullet_speed = speed
