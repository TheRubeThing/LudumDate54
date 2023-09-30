extends Sprite2D
class_name Item

var handle: Marker2D = null

var item_pickup_scene: PackedScene

# This function is called from the player. Subclasses define specific use behaviour here.
func action():
	pass

func create_pickup():
	pass
