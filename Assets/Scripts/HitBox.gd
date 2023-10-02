extends Area2D

signal hit

enum groups { ENEMIES, PLAYER }
@export var group : groups


func _on_body_entered(body):
	if group == groups.PLAYER && body.is_in_group("ENEMIES"):
		emit_signal("hit", body.dmg, body.position, false)


func _on_area_entered(area):
	if group == groups.ENEMIES && area.is_in_group("PROJECTILES"):
		var thrown = false
		if area.is_in_group("THROWN"):
			print("Hit by throw")
			thrown = true
		emit_signal("hit", area.dmg, area.get_position(), thrown)
		area.destroy()

