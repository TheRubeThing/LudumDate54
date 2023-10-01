extends Item

@export var weapon_stats: WeaponStats
@export var bullet : PackedScene

var flipped = false
var ready_to_fire = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Muzzle/MuzzleFlash/Timer.timeout.connect(func(): $Muzzle/MuzzleFlash.visible = false)
	$FireRate.wait_time = weapon_stats.fire_rate
	$FireRate.timeout.connect(func(): ready_to_fire = true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mousePos = get_global_mouse_position()
	look_at(mousePos)

	if (global_position.x - mousePos.x < 0):
		unflip()
	else:
		flip()
		

func flip():
	if !flipped:
		position.x = -position.x
		# since the weapon sprite is upside down and flipped we need to invert
		# the muzzle y position so the muzzle flash isnt off
		$Muzzle.position.y = -$Muzzle.position.y
		flip_v = true
		flipped = true

func unflip():
	if flipped:
		position.x = -position.x
		$Muzzle.position.y = -$Muzzle.position.y
		flip_v = false
		flipped = false

func action():
	shoot()

func shoot():
	if ready_to_fire:
		if weapon_stats.ammo <= 0:
			print('out of ammo :(')
			return
		ready_to_fire = false
		var bullet_instance = self.bullet.instantiate()
		bullet_instance.set_bullet_speed(weapon_stats.bullet_speed)
		bullet_instance.set_dmg(weapon_stats.damage)
		get_parent().get_parent().add_child(bullet_instance)
		bullet_instance.transform = $Muzzle.global_transform
		$Muzzle/MuzzleFlash.visible = true
		$Muzzle/MuzzleFlash/Timer.start()
		$FireRate.start()
		weapon_stats.ammo -= 1
