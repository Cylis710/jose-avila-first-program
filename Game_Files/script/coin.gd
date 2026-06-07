extends Area2D

func _on_body_entered(body: CharacterBody2D) -> void:
	print("moneys! +1")
	body.coins += 1
	queue_free()
