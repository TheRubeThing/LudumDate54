extends ProgressBar

@export var diffSpeed : int
@export var player_health : Resource


# Called when the node enters the scene tree for the first time.
func _ready():
	if player_health:
		player_health.connect("damage_taken", _on_damage_taken)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var diff = (value - $DiffBar.value) * delta * diffSpeed / 100
	if diff < 0:
		$DiffBar.value += diff
	else:
		$DiffBar.value = value


func _on_damage_taken(amount):
	value -= amount
