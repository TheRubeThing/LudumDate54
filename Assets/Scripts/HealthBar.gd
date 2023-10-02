extends ProgressBar

enum groups { ENEMIES, PLAYER }

@export var diffSpeed : int
@export var group : groups

var stats : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	if group == groups.PLAYER:
		stats = Globals.player_stats
		stats.connect("health_updated", _on_stats_health_updated)
	else:
		stats = get_node("../../Stats")
		visible = false
		
	max_value = stats.max_health
	value = stats.current_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var diff = (value - $DiffBar.value) * delta * diffSpeed / 100
	if diff < 0:
		$DiffBar.value += diff
	else:
		$DiffBar.value = value


func _on_stats_health_updated(newVal):
	print("Health updated")
	value = newVal
	if value != max_value:
		visible = true
