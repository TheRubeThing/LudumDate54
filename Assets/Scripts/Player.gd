extends CharacterBody2D

@export var push_back_factor: int = 100

const SPEED = 100.0


func _ready():
	Globals.player = self


func _physics_process(delta):
	var direction_x = Input.get_axis("A_left", "D_right")
	var direction_y = Input.get_axis("W_up", "S_down")

	if direction_x || direction_y:
		velocity.x = direction_x * SPEED
		velocity.y = direction_y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _recoil(dir, amount):
	position += dir * amount * push_back_factor / 100


func _on_hit_box_hit(dmg, dmg_pos):
	var recoil_dir = (position - dmg_pos).normalized()
	_recoil(recoil_dir, dmg)
