extends StaticBody2D

signal die

export (int) var SPEED = 1

func die():
	queue_free()

func _physics_process(_delta):
	position.y += SPEED
