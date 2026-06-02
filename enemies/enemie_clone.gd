extends Node2D

const Bounce_Force = -200.0
const SPEED = 50.0

var direction = -1

@onready var ray_cast_2d = $RayCast2D
@onready var ray_cast_2d_2 = $RayCast2D2

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:

		if body.velocity.y > 0:
			body.velocity.y = Bounce_Force
			queue_free()
		else:
			print("ouch")

func _process(delta):
	if ray_cast_2d.is_colliding():
		direction = -1

	if ray_cast_2d_2.is_colliding():
		direction = 1

	position.x += direction * SPEED * delta
