extends Area2D

const Bounce_Force = -350.0

func _on_body_entered(body):
	print("boink!")

	if body.has_method("move_and_slide"):
		var v = body.velocity
		v.y = Bounce_Force
		body.velocity = v
