extends StaticBody2D

signal hit(damage)

export (int) var SPEED = rand_range(1.0, 2.0)
export (int) var HP = 3

func _physics_process(_delta):
	position.y += SPEED

func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("hit", HP)

func _on_hit(damage):
	HP -= damage
	if HP <= 0:
		queue_free()
		
