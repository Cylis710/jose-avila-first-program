extends Node2D

const Bounce_Force = -200.0
const SPEED = 50.0

var direction = -1
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var ray_cast_2d = $RayCast2D
@onready var ray_cast_2d_2 = $RayCast2D2
@onready var timer: Timer = $Area2D/CollisionShape2D/Timer

func _on_area_2d_body_entered(body):
		if body.velocity.y > 0:
			body.velocity.y = Bounce_Force
			queue_free()
		else:
			print("ouch")
			Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()
		timer.start()
func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()


func _process(delta):
	
	if ray_cast_2d.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_2d_2.is_colliding():
		direction = 1
		animated_sprite.flip_h = false

	position.x += direction * SPEED * delta
