extends Area2D

export (int) var SPEED = 5

func _physics_process(_delta):
	 position.y -= SPEED

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_area_entered(area):
	area.emit_signal("hit", 1)
	queue_free()
