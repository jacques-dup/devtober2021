extends KinematicBody2D

export (int) var speed = 500
export (int) var acceleration = 1000
export (int) var deceleration = 3000
export (int) var jump_boost = 300
export (int) var gravity = 600

var velocity = Vector2.ZERO

func jump():
	velocity.y = -jump_boost

func get_input(delta):
	var inputVector = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if Input.is_action_just_pressed("ui_up"):
		jump()
	velocity.x = move_toward(velocity.x, speed * inputVector, acceleration * delta)

func apply_gravity(delta):
	velocity.y = move_toward(velocity.y, gravity, gravity * delta)

func _physics_process(delta):
	apply_gravity(delta)
	get_input(delta)
	velocity = move_and_slide(velocity, Vector2.UP)
