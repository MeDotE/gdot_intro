extends RigidBody2D

func _ready():
	$AnimatedSprite2D.play()
	var types = $AnimatedSprite2D.get_sprite_frames().get_animation_names()
	$AnimatedSprite2D.animation = types[randi() % types.size()]


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
