extends Bullet
class_name ThrownItem

var item: Item


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	super.move(delta)
	$Sprite.rotation += 10
	if $Timer.is_stopped():
		create_pickup()
		queue_free()
		

func create_pickup():
	var pickup = load("res://Assets/Weapons/Item_pickup.tscn")
	pickup = pickup.instantiate()
	get_parent().add_child(pickup)
	pickup.set_item(item)
	pickup.position = position
	pickup.get_node("Sprite2D").texture = item.texture

func set_item(item: Node):
	self.item = item
	$Sprite.texture = item.texture
