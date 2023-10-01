extends Area2D

var dmg = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")
	$AnimationPlayer.play("Explosion")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animated_sprite_2d_animation_finished():
	queue_free()
	
func destroy():
	pass
