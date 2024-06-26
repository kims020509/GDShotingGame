extends Area2D

signal hit(damage)

export (PackedScene) var DeadEffect

export (int) var SPEED = rand_range(1.0, 2.0)
export (int) var HP = 3

func _physics_process(_delta):
	position.y += SPEED

func _exit_tree():
	var ui = get_parent().get_node("UI")
	var effect = DeadEffect.instance()
	ui.emit_signal("score_change", 100)
	effect.position = global_position
	get_parent().call_deferred("add_child",effect)

func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("hit", HP)

func _on_hit(damage):
	HP -= damage
	if HP <= 0:
		queue_free()

func _on_Enemy_A_body_entered(body):
	body.emit_signal("hit", 1)
	emit_signal("hit", HP)

