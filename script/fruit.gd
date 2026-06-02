extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_area_2d_body_entered(body: CharacterBody2D):
	if body.has_method("Heal"):
		body.Heal(5)
		queue_free()
