extends Sprite

export (PackedScene) var BULLET_SC

signal hit(damage)

var player_position

onready var player = get_parent().get_node("Player")


func _shot():
	var bullet = BULLET_SC.instance()
	bullet.position = global_position
	bullet.position.y -= 12
	get_parent().add_child(bullet)

func _physics_process(delta):
	player_position = player.global_position
	player_position.x += 50
	global_position = global_position.move_toward(player_position, 2)

func _on_ShotTimer_timeout():
	_shot()

func _on_hit(_damage):
	queue_free()

func _on_Hitbox_area_entered(_area):
	emit_signal("hit", 0)
