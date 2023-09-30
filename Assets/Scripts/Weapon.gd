extends Item

@export var weapon_stats: WeaponStats
@export var bullet : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mousePos = get_global_mouse_position()
	look_at(mousePos)

	if (mousePos.x - position.x < 0):
		flip_v = true
	else:
		flip_v = false

func action():
	shoot()

func shoot():
	var bullet_instance = self.bullet.instantiate()
	bullet_instance.set_bullet_speed(weapon_stats.bullet_speed)
	get_parent().get_parent().add_child(bullet_instance)
	bullet_instance.transform = $Muzzle.global_transform
