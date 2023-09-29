extends Node2D

signal change_player_health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var up = Input.is_action_just_pressed("ui_right")
	var down = Input.is_action_just_pressed("ui_left")
	if up:
		emit_signal("change_player_health", 20)
	if down:
		emit_signal("change_player_health", -20)
	pass

