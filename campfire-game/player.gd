extends CharacterBody2D


@export var max_energy = 6
var energy = 6
@onready var animated_sprite = $Player
@onready var energy_bar = $EnergyBar/AnimatedEnergy
@export var max_jumps = 2   # Allow 2 jumps (normal + double jump)
var jumps_done = 0          # How many jumps have been used

@export var energy_textures : Array[Texture2D]

func _ready():
	update_energy_display()
	
	

const SPEED = 300.0
const JUMP_VELOCITY = -600.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("up"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			jumps_done = 1
		elif jumps_done < max_jumps:
			velocity.y = JUMP_VELOCITY
			jumps_done += 1

	
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
			animated_sprite.flip_h = direction <0
		else:
			animated_sprite.play("walk")
			animated_sprite.flip_h = direction <0
	else:
		animated_sprite.play("jump")
	
	
func update_energy_display():
	energy = clamp(energy, 0, max_energy)



func lose_energy(amount):
	energy -= amount
	update_energy_display()
	

	
