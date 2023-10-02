extends CharacterBody2D

@export var movement_speed: float = 15
@export var dmg: int = 10
@export var push_back_factor: int = 100
@export var pushback_decay: float = 0.6
@export var score: int = 10
@export var item_drops: Array[PackedScene]
@export var item_drops_probablities: Array[int]
@export var empty_probability: int = 10

var brain: BaseBrain
var flipped_sprite: bool
var pushback_velocity = Vector2(0,0)
var player

var splatter_scene = preload("res://Assets/FX/splatter.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	player = Globals.player
	brain = get_node("Brain")
	$Sprite.play("new_animation")
	assert(item_drops.size() == item_drops_probablities.size())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pushback_velocity *= pushback_decay

	velocity = brain.think(position) * movement_speed + pushback_velocity
	$Sprite.flip_h = player.position.x < position.x
	move_and_slide()

	if player:
		$Sprite.flip_h = player.position.x < position.x


func add_target(target: Node2D):
	brain.add_target(target)


func remove_target():
	brain.remove_target()


func _recoil(dir, amount):
	pushback_velocity = dir * amount * push_back_factor


func _on_hit_box_hit(dmg_amount, dmg_pos, _thrown):
	var recoil_dir = (position - player.position).normalized()
	var splatter = splatter_scene.instantiate()
	splatter.position = dmg_pos
	get_parent().add_child(splatter)
	_recoil(recoil_dir, dmg_amount)


func _on_stats_am_dead(_hurt_by_thrown):
	if _hurt_by_thrown:
		drop_item(0)
	else:
		drop_item(empty_probability)
	Globals.add_to_score(score)
	queue_free() # Replace with function body.
	
func drop_item(_empty_probability):
	var total_prob = _empty_probability
	for prob in item_drops_probablities:
		total_prob += prob
	var dice_roll = randi() % total_prob
	var dice_check = 0
	for i in item_drops.size():
		dice_check += item_drops_probablities[i]
		if dice_roll < dice_check:
			if item_drops[i]:
				var weapon = item_drops[i].instantiate()
				weapon.position = position
				get_parent().add_child(weapon)
				break
