extends Sprite2D

@export var weapon_stats: WeaponStats
@export var bullet : PackedScene



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mousePos = get_global_mouse_position()
	look_at(mousePos)

	if (mousePos.x - position.x < 0):
		flip_v = true
	else:
		flip_v = false
	
	if Input.is_action_just_pressed("shoot"):
		shoot()


func shoot():
	var bullet_instance = bullet.instantiate()
	bullet_instance.set_bullet_speed(weapon_stats.bullet_speed)
	owner.add_child(bullet_instance)
	bullet_instance.transform = $Muzzle.global_transform
