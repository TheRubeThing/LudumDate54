class_name BaseBrain

extends Node

var _target: Node2D

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
