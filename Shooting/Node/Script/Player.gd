extends KinematicBody2D

export (int) var SPEED = 200
export (PackedScene) var BULLET_SC

var velocity = Vector2()

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
	if Input.is_action_just_pressed("shot"):
		get_parent().add_child(bullet)

func _physics_process(_delta):
	_move()
	_shot()
	velocity = move_and_slide(velocity)
