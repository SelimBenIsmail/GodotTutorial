extends RigidBody2D


func _ready():
	var  mob_type = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_type[randi()% mob_type.size()])

func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
