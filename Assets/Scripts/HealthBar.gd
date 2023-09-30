extends ProgressBar

@export var source : Node2D
@export var diffSpeed : int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var diff = (value - $DiffBar.value) * delta * diffSpeed / 100
	if diff < 0:
		$DiffBar.value += diff
	else:
		$DiffBar.value = value


func _on_game_world_change_player_health(newVal):
	value += newVal
