extends CharacterBody2D


const SPEED = 100.0


func _physics_process(delta):

	var direction_x = Input.get_axis("A_left", "D_right")
	var direction_y = Input.get_axis("W_up", "S_down")

	if direction_x || direction_y:
		velocity.x = direction_x
		velocity.y = direction_y
		$Sprite.walk()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		$Sprite.idle()
	
	velocity = velocity.normalized() * SPEED

	move_and_slide()
