extends KinematicBody2D

export(int) var acceleration : int = 20
export(float) var friction : float = acceleration*2
export(int) var gravity : int = 50
export(int) var jump_force : int = 500
export(int) var max_speed : int = 200
export(Vector2) var floor_vector : Vector2 = Vector2(0, -1)
export(Vector2) var velocity : Vector2 = Vector2(0,0)

func _physics_process(_delta):
	velocity.y += gravity
	velocity = move_and_slide(velocity, floor_vector)
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= acceleration
		$Sprite.flip_h = true
	elif Input.is_action_pressed("move_right"):
		velocity.x += acceleration
		$Sprite.flip_h = false
	else:
		# Slow down due to friction. Stop if friction makes us change directions.
		var x_direction = sign(velocity.x)
		velocity.x -= x_direction * friction
		if x_direction != sign(velocity.x):
			velocity.x = 0
		
	velocity.x = clamp(velocity.x, -max_speed, max_speed)
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jump_force
