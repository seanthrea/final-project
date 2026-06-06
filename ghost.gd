extends CharacterBody2D

@export var speed = 120

var player

func _ready():
	player = get_tree().get_first_node_in_group("player")
	await get_tree().process_frame


func _physics_process(delta):

	if player == null:
		return

	var direction = player.global_position - global_position

	if direction.length() == 0:
		return

	velocity = direction.normalized() * speed
	move_and_slide()

	for i in range(get_slide_collision_count()):

		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		if collider and collider.is_in_group("player"):
			collider.game_over()
