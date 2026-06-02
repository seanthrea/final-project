extends CharacterBody2D

@export var speed = 200


func game_over():
	get_tree().reload_current_scene()
	
func _physics_process(delta):

	var direction = Vector2.ZERO

	if Input.is_action_pressed("right"):
		direction.x += 1

	if Input.is_action_pressed("left"):
		direction.x -= 1

	if Input.is_action_pressed("down"):
		direction.y += 1

	if Input.is_action_pressed("up"):
		direction.y -= 1
	
	velocity = direction.normalized() * speed

	move_and_slide()

	for i in get_slide_collision_count():

		var collision = get_slide_collision(i)

		if collision.get_collider().name.contains("Ghost"):
			game_over()
			
	
