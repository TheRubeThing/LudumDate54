extends Area2D

signal hit

enum groups { ENEMIES, PLAYER }
@export var group : groups


func _on_body_entered(body):
	if group == groups.PLAYER && body.is_in_group("ENEMIES"):
		emit_signal("hit", body.dmg, body.position)


func _on_area_entered(area):
	if area.is_in_group("PROJECTILES"):
		emit_signal("hit", area.dmg, area.get_position())
		area.destroy()

