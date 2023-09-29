extends CharacterBody2D

@export var movement_speed: float = 100

var brain: BaseBrain

# Called when the node enters the scene tree for the first time.
func _ready():
	brain = get_node("Brain")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = brain.think(position) * movement_speed
	move_and_slide()
