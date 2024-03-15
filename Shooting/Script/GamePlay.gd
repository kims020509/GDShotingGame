extends Node2D

export (PackedScene) var EnemyASC

func create_enemy():
	var enemya = EnemyASC.instance()
	enemya.position.x = rand_range(0.0, 600.0)
	enemya.position.y = -50
	add_child(enemya)

func _ready():
	create_enemy()
	pass # Replace with function body.

func _on_SpawnTimer_timeout():
	create_enemy()
	pass # Replace with function body.
