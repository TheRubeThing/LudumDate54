extends Area2D

signal hit

enum groups { ENEMIES, PLAYER }
@export var group : groups


func _on_body_entered(body):
	if body.is_in_group("PROJECTILES") || (group == groups.PLAYER && body.is_in_group("ENEMIES")):
		var dmg = body.dmg
		var dmg_pos = body.position
		emit_signal("hit", dmg, dmg_pos)
