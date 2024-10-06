extends CharacterBody2D

@export var gravity = 500
@export var jump_speed = -300
@export var move_speed = 200

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float):
	if is_on_floor() == false:
		velocity.y += gravity * delta
	
	if is_on_floor() == true && Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
	
	# move left, right
	if Input.is_action_pressed("left") == true:
		velocity.x = -move_speed
		animated_sprite.flip_h = true
	if Input.is_action_pressed("right") == true:
		velocity.x = move_speed
		animated_sprite.flip_h = false
	if Input.is_action_pressed("left") == false && Input.is_action_pressed("right") == false || Input.is_action_pressed("left") == true && Input.is_action_pressed("right") == true:
		velocity.x = 0
	
	# animation
	if is_on_floor() == false:
		if velocity.y > 0:
			animated_sprite.play("jump")
		elif velocity.y < 0:
			animated_sprite.play("fall")
	else:
		if velocity.x == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	
	move_and_slide()
