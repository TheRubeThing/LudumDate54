extends CharacterBody2D

@export var health: Resource
@export var push_back_factor: int = 100
@export var pushback_decay: float = 0.8

const SPEED = 100.0

var equipped_item_instance: Item
var pushback_velocity = Vector2(0,0)

func _ready():
	Globals.player = self
	
func equip_item(item: PackedScene) -> bool :
	if (equipped_item_instance == null):
		self.equipped_item_instance = item.instantiate()
		add_child(equipped_item_instance)
		return true
	return false

func unequip_item():
	if (equipped_item_instance == null):
		return
	equipped_item_instance.queue_free()
	equipped_item_instance = null

# Uses the currently equipped item
func action():
	if (equipped_item_instance == null):
		return
	equipped_item_instance.action()

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
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
