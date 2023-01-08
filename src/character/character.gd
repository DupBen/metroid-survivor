class_name Character
extends CharacterBody2D

const SPEED = 50.0

@onready var sprite := $Sprite2D

func _physics_process(_delta: float) -> void:
	move()


func move() -> void:
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	velocity = direction.normalized() * SPEED
	
	if direction.x > 0: 
		sprite.flip_h = false
	else:
		sprite.flip_h = true

	move_and_slide()
