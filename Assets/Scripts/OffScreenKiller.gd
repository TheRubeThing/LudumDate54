extends Node

@export var kill_distance = 600

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = Globals.player
	if get_parent().position.distance_to(player.position) > kill_distance:
		get_parent().queue_free()
