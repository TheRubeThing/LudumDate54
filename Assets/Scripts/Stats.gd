extends Node

signal health_updated
signal am_dead

enum groups { ENEMIES, PLAYER }

@export var max_health : int
@export var group : groups

var current_health : int

# Called when the node enters the scene tree for the first time.
func _ready():
	if group == groups.PLAYER:
		Globals.player_stats = self
	
	current_health = max_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func take_damage(amount):
	current_health = max(current_health - amount, 0)
	emit_signal("health_updated", current_health)
	if current_health == 0:
		emit_signal("am_dead")

	
	
func heal(amount):
	current_health = min(current_health + amount, max_health)
	emit_signal("health_updated", current_health)


func _on_hit_box_hit(dmg, _dmg_dir):
	take_damage(dmg)
