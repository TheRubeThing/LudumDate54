extends Area2D

@export var item_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_resource(resource: Resource):
	pass

func _on_body_entered(body):
	if body.is_in_group("PLAYER"):
		if body.equip_item(item_scene):
			queue_free()
