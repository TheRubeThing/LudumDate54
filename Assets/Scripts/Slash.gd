extends Bullet

func _ready():
	$AnimatedSprite2D.play("Slash")

func _on_animated_sprite_2d_animation_finished():
	queue_free()
	
func destroy():
	pass
