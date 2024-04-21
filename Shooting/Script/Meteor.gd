extends Area2D

export (float) var SPEED = -4.0

func _physics_process(_delta):
	position.y -= SPEED
	rotation_degrees += rand_range(1.0, 2.0)

func _exit_tree():
	var rand_item = rand_range(0.0, 1.0)
	if int(rand_item):
		pass

func _on_Meteor_area_entered(_area):
	queue_free()

func _on_Meteor_body_entered(body):
	body.emit_signal("hit", 1)
	queue_free()
