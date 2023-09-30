extends Camera2D

@export var player_target : Node2D
@export var camera_speed : int = 200
@export var mouse_diff: int = 100
@export var shake_max_offset: int = 50
@export var shake_decay: int = 50

var trauma : float
var rng: RandomNumberGenerator


func _ready():
	rng = RandomNumberGenerator.new()
	trauma = 0


func _physics_process(delta):
	# Focal point
	var mouse_pos = get_local_mouse_position()
	var mouse_skew = mouse_pos * mouse_diff / 100.
	var focal_point = player_target.position + mouse_skew
	
	# Shake
	var offsetX = shake_max_offset * trauma * rng.randf_range(-1, 1)
	var offsetY = shake_max_offset * trauma * rng.randf_range(-1, 1)
	var shake_offset = Vector2(offsetX, offsetY)
	trauma = trauma * shake_decay / 100.
	
	position += (focal_point - position) * delta * camera_speed / 100 + shake_offset


func add_shake(val):
	trauma = min(trauma + val, 1)
	

func _on_game_world_change_player_health(val):
	add_shake(val / 100.)
