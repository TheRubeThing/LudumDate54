extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.score_updated.connect(update_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_score(new_score: int):
	print("Score set to: ", new_score)
	text = "KILLZ: " + str(new_score)
