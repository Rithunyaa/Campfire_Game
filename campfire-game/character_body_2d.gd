extends CharacterBody2D

@export var movement_speed = 200

@onready var sprite = $AnimatedSprite2D


func _physics_process(_delta):
	var x_speed = 0
	var y_speed = 0
	
	
	
	
	velocity = Vector2(x_speed, y_speed)
	move_and_slide()
	
	
	# Animation switching
	if x_speed != 0 or y_speed != 0:
		sprite.play("walk")
	else:
		sprite.play("idle")
	
	
	# Flip sprite left/right
	if x_speed < 0:
		sprite.flip_h = true
	elif x_speed > 0:
		sprite.flip_h = false

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
#
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
