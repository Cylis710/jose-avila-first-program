extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var Health = 115
var coins = 0
const SPEED = 95.0
const JUMP_VELOCITY = -210.0
#jump limit
const MAX_Jumps = 2
var Jumps_left = MAX_Jumps

#called every frame
func _physics_process(delta):

	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		Jumps_left = MAX_Jumps
	# Jump
	if Input.is_action_just_pressed("ui_accept") and Jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		animated_sprite.play("jump")
		Jumps_left -= 1

	# Movement
	var direction := Input.get_axis("ui_left", "ui_right")
# Animation
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walk")
	
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#flip the sprite 
	if direction <  0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false
	if not is_on_floor():
		animated_sprite.play("jump")
	move_and_slide()

#Healing
func Heal():
	Health += Heal()
	print("Health: ", Health)
