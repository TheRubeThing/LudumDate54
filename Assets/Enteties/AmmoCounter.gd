extends TextureRect

var transform
var current_ammo


# Called when the node enters the scene tree for the first time.
func _ready():
	current_ammo = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	update_ammo()
	update_rect()


#func update_ammo():
#	weapon = Globals.player.get_weapon()
#	current_ammo = weapon.ammo


func update_rect():
	var new_size = Vector2(8, current_ammo * 3)
	set_size(new_size)
