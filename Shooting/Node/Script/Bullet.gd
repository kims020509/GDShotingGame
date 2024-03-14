extends Area2D

export (int) var SPEED = 5

func _physics_process(_delta):
	 position.y -= SPEED

