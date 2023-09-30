extends AnimationPlayer


func _on_hit_box_hit(dmg, dmg_pos):
	play("Flash")
