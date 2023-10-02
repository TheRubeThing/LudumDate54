extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HighScore1.text = str(Globals.high_scores[0])
	$HighScore2.text = str(Globals.high_scores[1])
	$HighScore3.text = str(Globals.high_scores[2])
	$HighScore4.text = str(Globals.high_scores[3])
	$HighScore5.text = str(Globals.high_scores[4])
