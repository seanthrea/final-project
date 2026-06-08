extends Area2D

func _on_body_entered(body):

	if body.name == "Player":

		get_tree().current_scene.add_score()

		queue_free()

func _process(delta):
	rotation += delta * 2
	scale = Vector2.ONE * (1 + sin(Time.get_ticks_msec()/100.0)*0.1)
