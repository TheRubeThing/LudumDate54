extends TextureRect

var transform
var current_ammo


func _process(delta):
	update_ammo()


func update_ammo():
	var item = Globals.player.get_current_item()
	if item && "ammo" in item:
		visible = true
		current_ammo = item.ammo
		update_rect()
	else:
		visible = false


func update_rect():
	var new_size = Vector2(8, current_ammo * 3)
	set_size(new_size)
