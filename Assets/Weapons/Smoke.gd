extends AnimatedSprite2D


func smoke():
	visible = true
	play("default")



func _on_animation_finished():
	visible = false
