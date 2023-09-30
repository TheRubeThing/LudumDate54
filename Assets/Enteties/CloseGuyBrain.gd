extends BaseBrain

## Take the current position of the owner of the brain and
## returns a direction in which to move next
func think(current_local_position) -> Vector2:
	if _target:
		var direction = (_target.position - current_local_position).normalized()
		return direction
	else:
		return super.think(current_local_position)
		
