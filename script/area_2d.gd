extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body):
		body.Heal(5)
		print("hp^+^", body.Health)
		queue_free()
