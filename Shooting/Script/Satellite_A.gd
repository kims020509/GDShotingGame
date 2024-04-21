extends Area2D

signal hit(damage)

export (PackedScene) var DeadEffect
export (PackedScene) var BULLET_SC

export (int) var SPEED = rand_range(0.1, 1.0)
export (int) var HP = 2

func _physics_process(_delta):
	position.y += SPEED

func _exit_tree():
	var ui = get_parent().get_node("UI")
	var effect = DeadEffect.instance()
	ui.emit_signal("score_change", 100)
	effect.position = global_position
	get_parent().call_deferred("add_child", effect)

func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("hit", HP)

func _on_hit(damage):
	HP -= damage
	if HP <= 0:
		queue_free()

func _on_Enemy_A_body_entered(body):
	body.emit_signal("hit", 1)
	emit_signal("hit", HP)

func _on_Timer_timeout():
	var bullet = BULLET_SC.instance()
	bullet.position = global_position
	bullet.position.y -= 12
	get_parent().add_child(bullet)
	SPEED = rand_range(2.0, 3.0)
