extends KinematicBody2D

signal hp_changed(hp)
signal hit(damage)

export (int) var HP = 5
export (int) var SPEED = 200
export (PackedScene) var BULLET_SC

var velocity = Vector2()

func _ready():
	emit_signal("hit", 0)
	emit_signal("hp_changed", HP)

func _move():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1;
	if Input.is_action_pressed("left"):
		velocity.x -= 1;
	if Input.is_action_pressed("down"):
		velocity.y += 1;
	if Input.is_action_pressed("up"):
		velocity.y -= 1;
	velocity = velocity.normalized()*SPEED

func _shot():
	var bullet = BULLET_SC.instance()
	bullet.position = global_position
	bullet.position.y -= 12
	get_parent().add_child(bullet)

func _physics_process(_delta):
	_move()
	velocity = move_and_slide(velocity)

func _on_ShotTimer_timeout():
	_shot()

func _on_hit(damage):
	HP -= damage
	emit_signal("hp_changed", HP)
	pass 
