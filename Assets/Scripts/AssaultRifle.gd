extends Sprite2D
class_name Weapon

@export var weapon_stats: WeaponsStats


func _get_configuration_warning():
	if not weapon_stats:
		return 'weapon_stats not set.'
	return ''

func _process(delta):
	var mousePos = get_global_mouse_position()
	look_at(mousePos)

	if (mousePos.x - position.x < 0):
		flip_v = true
	else:
		flip_v = false
