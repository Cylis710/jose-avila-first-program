extends CharacterBody2D

var Health = 115
var coins = 0

const SPEED = 150.0
const JUMP_VELOCITY = -230.0

#jump limit
const MAX_Jumps = 2
var Jumps_left = MAX_Jumps

func _physics_process(delta):

	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		Jumps_left = MAX_Jumps

	# Jump
	if Input.is_action_just_pressed("ui_accept") and Jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		Jumps_left -= 1

	# Movement
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func Heal(amount):
	Health += amount
	print("Health: ", Health)
	

func Damage(amount):
	Health -= amount
	print("Health: ", Health)
	

	if Health <= 0:
		get_tree().reload_current_scene()
		return
