extends TextureRect

var transform
var current_ammo


func _process(delta):
	update_ammo()


func update_ammo():
	var item = Globals.player.get_current_item()
	if item && "weapon_stats" in item:
		current_ammo = item.weapon_stats.ammo
		if current_ammo > 0:
			visible = true
			update_rect()
			return
	
	visible = false


func update_rect():
	var new_size = Vector2(8, current_ammo * 3)
	set_size(new_size)
