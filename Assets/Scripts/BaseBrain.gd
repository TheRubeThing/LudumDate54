class_name BaseBrain

extends Node

var _target: Node2D

func _ready():
	_target = Globals.player

## Take the current position of the owner of the brain and
## returns a direction in which to move next
func think(current_local_position) -> Vector2:
	return Vector2(0, 0)

## Adds a target to the brain
func add_target(target: Node2D):
	_target = target

## Removes a target from the brain
func remove_target():
	_target = null

func _on_detection_range_body_entered(body):
	if body.is_in_group("PLAYER"):
		add_target(body)


func _on_detection_range_body_exited(body):
	if body.is_in_group("PLAYER"):
		remove_target()
