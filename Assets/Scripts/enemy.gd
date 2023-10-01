extends CharacterBody2D

@export var movement_speed: float = 15
@export var dmg: int = 10
@export var push_back_factor: int = 100
@export var pushback_decay: float = 0.6

var brain: BaseBrain
var flipped_sprite: bool
var pushback_velocity = Vector2(0,0)
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = Globals.player
	brain = get_node("Brain")
	$Sprite.play("new_animation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pushback_velocity *= pushback_decay
	
	velocity = brain.think(position) * movement_speed + pushback_velocity
	$Sprite.flip_h = player.position.x < position.x	
	move_and_slide()


func add_target(target: Node2D):
	brain.add_target(target)


func remove_target():
	brain.remove_target()


func _recoil(dir, amount):
	pushback_velocity = dir * amount * push_back_factor


func _on_hit_box_hit(dmg_amount, dmg_pos):
	var recoil_dir = (position - dmg_pos).normalized()
	_recoil(recoil_dir, dmg_amount)


func _on_stats_am_dead():
	queue_free() # Replace with function body.
