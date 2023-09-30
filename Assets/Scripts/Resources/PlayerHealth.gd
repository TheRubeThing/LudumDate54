extends Resource
class_name PlayerHealth

signal damage_taken
signal healed
signal player_dead

@export var max_health: int = 100

var current_health : int = 100

func reset():
	current_health = max_health


func take_damage(amount):
	current_health = max(current_health - amount, 0)
	print(current_health)
	if current_health == 0:
		emit_signal("player_dead")
	else:
		emit_signal("damage_taken", amount)


func heal(amount):
	current_health = min(current_health + amount, max_health)
	emit_signal("healed", amount)
