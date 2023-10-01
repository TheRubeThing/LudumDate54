extends Area2D

@export var item_scene: PackedScene
var item: Item

# Called when the node enters the scene tree for the first time.
func _ready():
	self.item = item_scene.instantiate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# the scene the pickup should contain.
func set_item(item: Item):
	self.item = item

func _on_body_entered(body):
	if body.is_in_group("PLAYER"):
		if body.equip_item(item):
			queue_free()
