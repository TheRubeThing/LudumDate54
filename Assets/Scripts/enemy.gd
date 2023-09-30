extends CharacterBody2D

@export var movement_speed: float = 100
@export var dmg: int = 10

var brain: BaseBrain
var flipped_sprite: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	brain = get_node("Brain")
	$Sprite.play("new_animation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = brain.think(position) * movement_speed
	$Sprite.flip_h = velocity.x < 0
	move_and_slide()

func add_target(target: Node2D):
	brain.add_target(target)
	
func remove_target():
	brain.remove_target()
