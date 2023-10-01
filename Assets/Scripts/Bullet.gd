class_name Bullet

extends Area2D

var bullet_speed = 0
var dmg = 0

func _process(delta):
	move(delta)

func move(delta):
	position += transform.x * bullet_speed * delta * 100

func set_bullet_speed(bullet_speed: int):
	self.bullet_speed = bullet_speed

func set_dmg(dmg: int):
	self.dmg = dmg
	
func destroy():
	queue_free()
