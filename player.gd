extends CharacterBody2D

@export var speed = 200
@onready var animated_sprite = $AnimatedSprite2D


var is_dead = false

func game_over():
	if is_dead:
		return

	is_dead = true

	get_parent().call_deferred("game_over")

func _restart_scene():
	get_tree().reload_current_scene()
	
func _physics_process(delta):

	var direction = Vector2.ZERO

	if Input.is_action_pressed("up"):
		direction.y -= 1

	if Input.is_action_pressed("down"):
		direction.y += 1

	if Input.is_action_pressed("left"):
		direction.x -= 1

	if Input.is_action_pressed("right"):
		direction.x += 1

	direction = direction.normalized()

	velocity = direction * speed

	move_and_slide()

	# WALKING ANIMATION
	if direction != Vector2.ZERO:

		if abs(direction.x) > abs(direction.y):

			if direction.x > 0:
				animated_sprite.play("right")
			else:
				animated_sprite.play("left")
		else:
			if direction.y > 0:
				animated_sprite.play("down")
			else:
				animated_sprite.play("up")

	else:
		animated_sprite.stop()

	for i in range(get_slide_collision_count()):

		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		if collider and collider.is_in_group("ghost"):
			game_over()
				
	
