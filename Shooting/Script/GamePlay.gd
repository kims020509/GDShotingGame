extends Node2D

export (PackedScene) var Enemy_ASC

func create_enemy():
	var EnemyA = Enemy_ASC.instance()
	EnemyA.position.x = rand_range(0.0, 600.0)
	EnemyA.position.y = -50
	add_child(EnemyA)

func _ready():
	create_enemy()

func _on_SpawnTimer_timeout():
	create_enemy()
