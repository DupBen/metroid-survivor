class_name Character
extends CharacterBody2D

const SPEED = 50.0

func _physics_process(delta: float) -> void:
	move(delta)

func move(delta: float) -> void:
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_collide(velocity * delta)
