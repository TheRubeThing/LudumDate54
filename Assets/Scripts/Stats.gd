extends Node

signal health_updated
signal am_dead

enum groups { ENEMIES, PLAYER }

@export var max_health : int
@export var group : groups

var current_health : int
var hurt_by_thrown = false

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
	print("emitting health update")
	emit_signal("health_updated", current_health)
	if current_health == 0:
		emit_signal("am_dead", hurt_by_thrown)

	
	
func heal(amount):
	current_health = min(current_health + amount, max_health)
	emit_signal("health_updated", current_health)


func _on_hit_box_hit(dmg, _dmg_dir, _thrown):
	hurt_by_thrown = _thrown
	take_damage(dmg)
