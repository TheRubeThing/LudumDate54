extends ProgressBar

@export var diffSpeed : int
var player_stats : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	player_stats = Globals.player_stats
	player_stats.connect("health_updated", _on_health_change)
	value = player_stats.current_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var diff = (value - $DiffBar.value) * delta * diffSpeed / 100
	if diff < 0:
		$DiffBar.value += diff
	else:
		$DiffBar.value = value


func _on_health_change(newVal):
	value = newVal
