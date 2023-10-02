extends AnimatedSprite2D

func walk():	
	play("Walk")
	
func idle():
	play("Idle")
	
func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var look_direction = (mouse_pos.x - to_global(position).x)
	flip_h = look_direction < 0
