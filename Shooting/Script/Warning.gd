extends Sprite

export (PackedScene) var Meteor_SC

func _on_Timer_timeout():
	var meteor = Meteor_SC.instance()
	meteor.position = global_position
	meteor.position.y -= 100
	get_tree().root.add_child(meteor)
	queue_free()
