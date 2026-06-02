extends Node2D

func _on_area_2d_body_entered(body: CharacterBody2D):
	if body.has_method("Heal"):
		body.Heal(5)
		print("yup")
		queue_free()
