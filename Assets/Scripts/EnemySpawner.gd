extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_interval: float = 1.0

enum SpawnEdge {LEFT, RIGHT, TOP, BOTTOM}
	

func _ready():
	$SpawnTimer.timeout.connect(on_timer_timeout)
	$SpawnTimer.start(spawn_interval)
	
func on_timer_timeout():
	spawn_enemy()
	
func spawn_enemy():
	# Instantiate enemy node
	var enemy = enemy_scene.instantiate()
	
	# Get spawn position
	enemy.position = get_spawn_position()
	
	# Add enemy to tree
	get_parent().add_child(enemy)
	
func get_spawn_position() -> Vector2:
	var bounds = get_viewport_rect().size
	var camera_pos = get_viewport().get_camera_2d().position
	var edge = randi() % SpawnEdge.size()
	var mid_point = bounds / 2
	var spawn_position = Vector2(0,0)
	match edge:
		SpawnEdge.LEFT:
			spawn_position = Vector2(randf_range(-20, 0), randf_range(0, bounds.y))
		SpawnEdge.RIGHT:
			spawn_position =  Vector2(randf_range(bounds.x, bounds.x + 20), randf_range(0, bounds.y))
		SpawnEdge.TOP:
			spawn_position =  Vector2(randf_range(0, bounds.x), randf_range(-20, 0))
		SpawnEdge.BOTTOM:
			spawn_position =  Vector2(randf_range(0, bounds.x), randf_range(bounds.y, bounds.y + 20))
	return spawn_position + camera_pos - mid_point
	
