extends CharacterBody2D

@export var health: Resource
@export var push_back_factor: int = 100
@export var pushback_decay: float = 0.8

const SPEED = 100.0

var equipped_item_instance: Item
var pushback_velocity = Vector2(0,0)

func _ready():
	Globals.player = self
	
func get_current_item():
	return equipped_item_instance	

func equip_item(item: Item) -> bool :
	if (equipped_item_instance != null):
		return false

	self.equipped_item_instance = item
	add_child(equipped_item_instance)

	# offset item position if it has a handle.
	var handle = equipped_item_instance.get_node_or_null("Handle")
	if handle:
		equipped_item_instance.position -= handle.position

	return true


func unequip_item():
	if (equipped_item_instance == null):
		return

	var thrown_item = load("res://Assets/Weapons/ThrownItem.tscn")
	thrown_item = thrown_item.instantiate()
	thrown_item.set_item(equipped_item_instance.duplicate())
	thrown_item.set_bullet_speed(3)
	thrown_item.transform = equipped_item_instance.global_transform
	owner.add_child(thrown_item)
	# set direction
	

	equipped_item_instance.queue_free()
	equipped_item_instance = null

# Uses the currently equipped item
func action():
	if (equipped_item_instance == null):
		return
	equipped_item_instance.action()

func _process(_delta):
	if Input.is_action_pressed("shoot"):
		action()
	if Input.is_action_just_pressed("throw"):
		unequip_item()

func _physics_process(delta):
	var direction_x = Input.get_axis("A_left", "D_right")
	var direction_y = Input.get_axis("W_up", "S_down")
	
	pushback_velocity *= pushback_decay

	if direction_x || direction_y:
		velocity.x = direction_x
		velocity.y = direction_y
		$Sprite.walk()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		$Sprite.idle()
	
	velocity = (velocity.normalized() * SPEED) + pushback_velocity

	move_and_slide()


func _recoil(dir, amount):
	pushback_velocity = dir * amount * push_back_factor


func _on_hit_box_hit(dmg, dmg_pos):
	var recoil_dir = (position - dmg_pos).normalized()
	_recoil(recoil_dir, dmg)


func _on_stats_am_dead():
	Globals.game_over() # Replace with function body.
